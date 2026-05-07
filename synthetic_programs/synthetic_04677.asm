; mixed program
; initialization
  LDI r8, 2690
  LDI r4, 0x359ED0
  LDI r15, 0x6E5881
  LDI r26, 1596
  LDI r14, 255
  OR r7, r14, r3
  XOR r0, r6, r28
  OR r0, r12, r6
  OR r8, r12, r10
  LDI r11, 0x9175CF
  STORE r11, r10
  LOAD r1, r11
  LDI r12, 8
  STORE r12, r11
  LOAD r6, r12
  LDI r14, 0x446CF9
  STORE r14, r7
  LOAD r2, r14
  LDI r7, 0xB2A83F
  STORE r7, r4
  LOAD r11, r7
  LDI r7, 0xD4EB8C
  STORE r7, r11
  LOAD r15, r7
  LDI r12, 10
  STORE r12, r0
  LOAD r9, r12
  LDI r16, 325
  STORE r16, r1
  LOAD r5, r16
  LDI r1, 0x0000CA
  STORE r1, r8
  LOAD r6, r1
  LDI r7, 0xFBFCB8
  STORE r7, r2
  LOAD r1, r7
  CMP r13, r11
  JNZ r13, else_0
  DIV r4, r11, r22
  JMP endif_1
else_0:
  LDI r9, 0x5C842B
  LDI r8, 3628
  LDI r15, 0xA5DBC0
  PSET r9, r8, r15
  LDI r1, 10
  LDI r3, 0x1118AA
  LDI r1, 8
  LDI r9, 255
  LDI r19, 1844
  RECTF r1, r3, r1, r9, r19
  LDI r14, 0x947597
  FILL r14
  LDI r11, 570
  FILL r11
endif_1:
  PUSH r9
  PUSH r13
  MOD r12, r19, r8
  OR r15, r6, r7
  OR r12, r11, r4
  SHL r14, r11, r4
  MOD r8, r14, r15
  POP r13
  POP r9
  HALT
