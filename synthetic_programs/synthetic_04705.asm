; conditional logic
; initialization
  LDI r9, 0
  LDI r2, 16
  LDI r14, 256
  LDI r1, 32
  LDI r0, 0xB425CE
  CMP r3, r15
  JZ r3, else_0
  SUB r8, r7, r2
  OR r3, r14, r2
  JMP endif_1
else_0:
  LDI r3, 128
  LDI r7, 0x7A6301
  LDI r12, 2663
  LDI r15, 593
  LDI r4, 0x8F0472
  RECTF r3, r7, r12, r15, r4
endif_1:
  HALT
