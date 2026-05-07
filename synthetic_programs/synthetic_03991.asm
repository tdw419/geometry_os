; conditional logic
; initialization
  LDI r12, 1721
  LDI r2, 380
  LDI r3, 2317
  LDI r1, 32
  CMP r14, r7
  JZ r14, else_0
  ADD r5, r15, r9
  AND r4, r12, r15
  JMP endif_1
else_0:
  LDI r13, 765
  LDI r15, 1598
  LDI r8, 112
  LDI r1, 2398
  LDI r13, 3981
  RECTF r13, r15, r8, r1, r13
  LDI r6, 32
  LDI r11, 3095
  LDI r2, 0x659CD6
  LDI r8, 64
  CIRCLE r6, r11, r2, r8
  LDI r13, 255
  LDI r5, 0x9EACCA
  LDI r4, 1
  LDI r13, 0
  LDI r11, 128
  LINE r13, r5, r4, r13, r11
endif_1:
  CMP r10, r3
  JZ r10, else_2
  XOR r5, r14, r9
  XOR r14, r4, r11
  SHR r13, r0, r3
  JMP endif_3
else_2:
  LDI r1, 0x6B3FBB
  LDI r1, 0xFEDC7F
  LDI r2, 0xEE58BC
  PSET r1, r1, r2
endif_3:
  HALT
