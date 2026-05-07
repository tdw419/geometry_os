; conditional logic
; initialization
  LDI r2, 0
  LDI r8, 1
  LDI r11, 0x2F7FB5
  LDI r12, 1
  LDI r9, 0xDC0C02
  LDI r6, 1910
  LDI r0, 0x26462C
  CMP r13, r4
  JZ r13, else_0
  SHL r15, r0, r6
  ADD r6, r12, r0
  AND r11, r14, r0
  OR r10, r0, r9
  JMP endif_1
else_0:
  LDI r9, 0x359AD9
  LDI r15, 141
  LDI r9, 2561
  LDI r3, 1406
  LDI r14, 255
  LINE r9, r15, r9, r3, r14
endif_1:
  CMP r7, r8
  JZ r7, else_2
  SHL r3, r2, r7
  MOD r13, r5, r6
  DIV r9, r15, r3
  JMP endif_3
else_2:
  LDI r15, 128
  LDI r0, 0x95DFEE
  LDI r12, 0xDA6FCF
  PSET r15, r0, r12
endif_3:
  CMP r12, r5
  JNZ r12, else_4
  SHR r10, r7, r13
  JMP endif_5
else_4:
  LDI r14, 2543
  LDI r6, 255
  LDI r2, 1716
  LDI r11, 16
  LDI r9, 0xAF844A
  LINE r14, r6, r2, r11, r9
  LDI r9, 0xE83608
  LDI r10, 0x3E65B4
  LDI r7, 0xFDEB60
  LDI r12, 4
  LDI r9, 128
  RECTF r9, r10, r7, r12, r9
  LDI r11, 1
  FILL r11
  LDI r2, 3953
  LDI r10, 64
  LDI r3, 2925
  LDI r31, 1
  CIRCLE r2, r10, r3, r31
endif_5:
  HALT
