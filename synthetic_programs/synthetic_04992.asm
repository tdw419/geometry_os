; mixed program
; initialization
  LDI r3, 0xA85261
  LDI r14, 256
  IKEY r9
  CMPI r9, 64
  JNZ r9, key_0
  LDI r14, 0x5600AD
  STORE r14, r3
  LOAD r10, r14
  LDI r13, 2130
  STORE r13, r10
  LOAD r4, r13
  LDI r0, 0xDB455C
  STORE r0, r7
  LOAD r5, r0
  LDI r12, 2
  STORE r12, r2
  LOAD r3, r12
  LDI r7, 0xED2903
  LDI r4, 256
  LDI r5, 32
  TEXT r7, r4, r5, "HELLO"
  IKEY r1
  CMPI r1, 1
  JNZ r1, key_1
  CALL func_2
func_2:
  MOD r1, r16, r6
  SHR r7, r9, r12
  OR r4, r13, r2
  SHR r9, r14, r2
  RET
  CMP r15, r29
  JNZ r15, else_3
  MUL r14, r13, r3
  SHR r14, r13, r15
  JMP endif_4
else_3:
  LDI r13, 0x73E690
  LDI r26, 0x6ABB71
  LDI r8, 128
  WPIXEL
endif_4:
  LDI r13, 25
  LDI r11, 256
  LDI r15, 3251
  WPIXEL
  HALT
