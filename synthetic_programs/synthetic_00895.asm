; conditional logic
; initialization
  LDI r6, 330
  LDI r17, 64
  LDI r7, 3452
  LDI r15, 0x2850B7
  LDI r1, 2731
  LDI r14, 500
  LDI r10, 0
  CMP r5, r4
  JZ r5, else_0
  SUB r5, r14, r2
  JMP endif_1
else_0:
  LDI r13, 0xB78B85
  LDI r8, 0xAEE48F
  LDI r13, 128
  PSETI
  LDI r3, 0x5538FC
  LDI r15, 128
  LDI r3, 16
  LDI r17, 0x142E63
  CIRCLE r3, r15, r3, r17
  LDI r8, 256
  LDI r13, 2828
  LDI r13, 1
  LDI r7, 64
  LDI r7, 2169
  LINE r8, r13, r13, r7, r7
  LDI r15, 128
  LDI r13, 128
  LDI r0, 2601
  PSET r15, r13, r0
endif_1:
  HALT
