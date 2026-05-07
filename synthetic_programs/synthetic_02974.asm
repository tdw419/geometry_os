; mixed program
; initialization
  LDI r4, 2603
  LDI r6, 392
  LDI r11, 0x271BC6
  LDI r12, 1292
  LDI r13, 644
  LDI r1, 1191
  AND r11, r1, r10
  XOR r15, r2, r11
  PUSH r13
  PUSH r12
  PUSH r5
  PUSH r1
  AND r8, r1, r4
  XOR r14, r4, r11
  SHL r11, r9, r14
  POP r1
  POP r5
  POP r12
  POP r13
  CMP r9, r23
  JNZ r9, else_0
  MOD r13, r10, r7
  XOR r3, r4, r7
  JMP endif_1
else_0:
  LDI r7, 0x942DA2
  LDI r4, 0x2BC808
  LDI r1, 128
  PSET r7, r4, r1
  LDI r13, 0xDBCB73
  LDI r7, 850
  LDI r7, 0x8CDC40
  LDI r1, 3854
  LDI r12, 4084
  LINE r13, r7, r7, r1, r12
  LDI r4, 574
  LDI r13, 0
  LDI r1, 4
  LDI r7, 0xE76409
  LDI r8, 0xEBDF4F
  LINE r4, r13, r1, r7, r8
endif_1:
  CMP r6, r1
  HALT
