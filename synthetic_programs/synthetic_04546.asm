; conditional logic
; initialization
  LDI r14, 0xC387C5
  LDI r4, 1763
  LDI r5, 32
  LDI r12, 510
  LDI r9, 337
  LDI r8, 2747
  LDI r10, 8
  CMP r6, r2
  JZ r6, else_0
  XOR r13, r9, r1
  DIV r0, r7, r8
  SUB r4, r5, r11
  JMP endif_1
else_0:
  LDI r7, 4
  LDI r15, 1
  LDI r6, 3835
  PSET r7, r15, r6
  LDI r5, 0x4BAAB7
  LDI r4, 3128
  LDI r2, 0x1F38F0
  LDI r5, 710
  LDI r10, 1592
  RECTF r5, r4, r2, r5, r10
  LDI r0, 10
  LDI r5, 128
  LDI r4, 0x0D10B7
  PSETI
  LDI r5, 1464
  LDI r1, 2008
  LDI r8, 0xC0A525
  LDI r12, 0xBA0324
  LDI r12, 1348
  RECTF r5, r1, r8, r12, r12
endif_1:
  HALT
