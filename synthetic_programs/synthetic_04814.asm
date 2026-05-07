; mixed program
; initialization
  LDI r14, 16
  LDI r6, 0xEFA837
  LDI r0, 1467
  SHR r15, r10, r14
  CMP r10, r7
  JNZ r10, else_0
  OR r5, r12, r8
  OR r10, r14, r15
  DIV r7, r30, r6
  DIV r2, r9, r14
  JMP endif_1
else_0:
  LDI r9, 64
  LDI r3, 2
  LDI r18, 2531
  LDI r12, 255
  LDI r10, 0x147055
  LINE r9, r3, r18, r12, r10
  LDI r0, 10
  LDI r9, 0x14DFF8
  LDI r12, 0
  PSET r0, r9, r12
endif_1:
  LDI r4, 255
  STORE r4, r12
  LOAD r3, r4
  LDI r15, 256
  STORE r15, r13
  LOAD r4, r15
  LDI r6, 64
  STORE r6, r5
  LOAD r24, r6
  LDI r11, 1712
  STORE r11, r2
  LOAD r12, r11
  LDI r14, 1973
  STORE r14, r9
  LOAD r15, r14
  HALT
