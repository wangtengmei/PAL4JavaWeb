CREATE TABLE if not exists jacg_method_call_{appName} (
  call_id int NOT NULL COMMENT '调用序号',
  call_type varchar(10) NOT NULL COMMENT '调用类型',
  enabled tinyint NOT NULL COMMENT '是否启用，1:启用',
  caller_jar_num int NOT NULL COMMENT '调用方，Jar包序号',
  caller_method_hash varchar(30) NOT NULL COMMENT '调用方，方法hash+字节数',
  caller_simple_class_name varchar(500) NOT NULL COMMENT '调用方，唯一类名（全名或简单类名）',
  caller_method_name varchar(300) NOT NULL COMMENT '调用方，方法名',
  caller_full_method text NOT NULL COMMENT '调用方，完整方法（类名+方法名+参数）',
  caller_line_number int NOT NULL COMMENT '调用方，源代码行号',
  callee_method_hash varchar(30) NOT NULL COMMENT '被调用方，方法hash+字节数',
  callee_simple_class_name varchar(500) NOT NULL COMMENT '被调用方，唯一类名（全名或简单类名）',
  callee_method_name varchar(300) NOT NULL COMMENT '被调用方，方法名',
  callee_full_method text NOT NULL COMMENT '被调用方，完整方法（类名+方法名+参数）',
  call_flags int NOT NULL COMMENT '方法调用标记',
  PRIMARY KEY (call_id),
  INDEX idx_mc_rmh_{appName}(caller_method_hash),
  INDEX idx_mc_1_{appName}(callee_method_hash, caller_method_hash),
  INDEX idx_mc_rsn_{appName}(caller_simple_class_name(255)),
  INDEX idx_mc_esn_{appName}(callee_simple_class_name(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='方法调用关系表';