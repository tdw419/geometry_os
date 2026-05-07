; conditional logic
; initialization
  LDI r12, 64
  LDI r15, 3946
  LDI r6, 2184
  LDI r1, 128
  LDI r4, 0
  CMP r12, r2
  JZ r12, else_0
  ADD r8, r1, r7
  ADD r15, r7, r5
  ADD r14, r2, r15
  JMP endif_1
else_0:
  LDI r4, 693
  LDI r4, 0xFD752A
  LDI r5, 64
  LDI r7, 2
  LDI r4, 3947
  RECTF r4, r4, r5, r7, r4
endif_1:
  HALT
