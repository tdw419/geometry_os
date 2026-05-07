; conditional logic
; initialization
  LDI r8, 880
  LDI r0, 0
  LDI r6, 2
  LDI r1, 0x0E2BDE
  LDI r10, 2
  CMP r0, r7
  JZ r0, else_0
  XOR r12, r8, r11
  SHL r2, r7, r12
  JMP endif_1
else_0:
  LDI r13, 0x7F8657
  LDI r11, 16
  LDI r13, 1603
  PSET r13, r11, r13
  LDI r1, 2
  LDI r13, 121
  LDI r14, 10
  LDI r5, 0x0D43F7
  LDI r2, 0x2005D0
  RECTF r1, r13, r14, r5, r2
endif_1:
  HALT
