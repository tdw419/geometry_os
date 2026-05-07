; mixed program
; initialization
  LDI r10, 2566
  LDI r3, 16
  LDI r15, 0xF6309F
  LDI r5, 0x265882
  LDI r21, 0xF85066
  LDI r12, 0x242D97
  IKEY r4
  CMPI r4, 0xE687B9
  JNZ r4, key_0
  SHR r1, r0, r15
  SHLI r11, r1, 0
  DIV r14, r7, r3
  CMPI r9, 2
  CALL func_1
func_1:
  MUL r13, r23, r0
  OR r15, r13, r8
  RET
  LDI r9, 0x9371F7
  STORE r9, r4
  LOAD r3, r9
  LDI r7, 0xAD4E83
  STORE r7, r9
  LOAD r5, r7
  HALT
