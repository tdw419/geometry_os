; conditional logic
; initialization
  LDI r10, 32
  LDI r17, 128
  LDI r11, 8
  LDI r4, 2219
  LDI r15, 16
  LDI r7, 0xD3EC9A
  LDI r1, 3088
  LDI r6, 777
  CMP r9, r13
  JZ r9, else_0
  ADD r5, r8, r7
  DIV r29, r8, r7
  XOR r5, r1, r14
  JMP endif_1
else_0:
  LDI r9, 646
  LDI r7, 2290
  LDI r9, 10
  LDI r6, 0xB2A542
  CIRCLE r9, r7, r9, r6
  LDI r14, 32
  LDI r2, 0xCCF03A
  LDI r9, 4
  LDI r11, 256
  LDI r15, 3252
  RECTF r14, r2, r9, r11, r15
  LDI r14, 8
  LDI r9, 3046
  LDI r11, 1121
  PSET r14, r9, r11
endif_1:
  HALT
