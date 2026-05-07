; mixed program
; initialization
  LDI r15, 64
  LDI r1, 64
  LDI r12, 0x8C8228
  LDI r0, 437
  LDI r6, 0
  LDI r11, 2599
  LDI r2, 255
  TEXT r6, r11, r2, "HELLO"
  OR r12, r14, r6
  OR r1, r3, r10
  OR r5, r12, r9
  XOR r7, r1, r10
  LDI r7, 2149
  STORE r7, r4
  LOAD r5, r7
  LDI r14, 2880
  STORE r14, r13
  LOAD r12, r14
  LDI r1, 4
  STORE r1, r25
  LOAD r0, r1
  LDI r0, 0xB5068C
  STORE r0, r4
  LOAD r11, r0
  LDI r7, 0xB5E6C0x23D5
  STORE r7, r14
  LOAD r3, r7
  PUSH r6
  DIV r12, r14, r3
  ADD r5, r1, r9
  SHR r11, r7, r13
  POP r6
  CALL func_0
func_0:
  SHR r18, r6, r4
  XOR r15, r2, r11
  RET
  CMP r13, r3
  JNZ r13, else_1
  MUL r8, r9, r3
  DIV r11, r9, r5
  JMP endif_2
else_1:
  LDI r14, 3621
  LDI r13, 10
  LDI r9, 255
  PSET r14, r13, r9
  LDI r13, 3108
  LDI r5, 2823
  LDI r8, 16
  LDI r3, 0x43C39B
  LDI r7, 255
  RECTF r13, r5, r8, r3, r7
  LDI r0, 32
  LDI r1, 2
  LDI r6, 0xAD2EA7
  PSETI
endif_2:
  LDI r13, 3242
  STORE r13, r5
  LOAD r11, r13
  LDI r6, 0x4C6BC7
  STORE r6, r12
  LOAD r22, r6
  LDI r9, 1132
  STORE r9, r11
  LOAD r0, r9
  LDI r13, 3547
  STORE r13, r12
  LOAD r25, r13
  LDI r4, 2155
  LDI r8, 0x07B367
  LDI r5, 0
  TEXT r4, r8, r5, "HELLO"
  HALT
