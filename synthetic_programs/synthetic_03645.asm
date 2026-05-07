; mixed program
; initialization
  LDI r14, 256
  LDI r11, 0xA21DD1
  LDI r9, 256
  LDI r3, 0x76CD0A
  LDI r5, 0
  LDI r13, 255
  OR r14, r4, r11
  AND r28, r7, r10
  OR r31, r12, r1
  LDI r1, 128
  STORE r1, r15
  LOAD r8, r1
  LDI r2, 112
  STORE r2, r5
  LOAD r12, r2
  LDI r6, 0x8515E8
  STORE r6, r10
  LOAD r28, r6
  OR r5, r10, r9
  XOR r10, r8, r3
  XOR r1, r10, r7
  AND r15, r5, r0
  IKEY r10
  CMPI r10, 76
  JNZ r10, key_0
  SHL r15, r14, r12
  CALL func_1
func_1:
  MUL r12, r8, r10
  DIV r15, r8, r13
  SHR r1, r11, r2
  SUB r6, r0, r14
  ADD r2, r7, r18
  RET
  CMP r12, r10
  JZ r12, else_2
  SUB r7, r8, r3
  DIV r5, r0, r11
  JMP endif_3
else_2:
  LDI r15, 1978
  LDI r15, 578
  LDI r2, 43
  LDI r12, 3166
  LDI r10, 280
  LINE r15, r15, r2, r12, r10
  LDI r11, 0xA56C18
  LDI r25, 10
  LDI r12, 0x981254
  WPIXEL
  LDI r13, 0x49763D
  LDI r15, 41
  LDI r15, 3199
  WPIXEL
  LDI r14, 140
  LDI r8, 128
  LDI r6, 1198
  LDI r10, 2970
  LDI r10, 1831
  RECTF r14, r8, r6, r10, r10
endif_3:
  SHLI r3, r0, 0xC935A0
  SAR r14, r10, r7
  HALT
