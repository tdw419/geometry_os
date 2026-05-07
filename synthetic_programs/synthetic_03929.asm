; conditional logic
; initialization
  LDI r10, 255
  LDI r13, 2887
  LDI r1, 3880
  LDI r14, 10
  CMP r14, r10
  JZ r14, else_0
  SUB r10, r0, r6
  JMP endif_1
else_0:
  LDI r11, 802
  LDI r1, 4043
  LDI r7, 1671
  PSET r11, r1, r7
  LDI r3, 64
  LDI r8, 1531
  LDI r10, 8
  LDI r13, 3111
  LDI r15, 1177
  RECTF r3, r8, r10, r13, r15
  LDI r13, 3741
  LDI r10, 4
  LDI r4, 934
  PSET r13, r10, r4
endif_1:
  HALT
