; conditional logic
; initialization
  LDI r20, 32
  LDI r2, 32
  LDI r5, 0x3CB05F
  LDI r3, 256
  LDI r9, 0x22EFEC
  LDI r14, 64
  CMP r6, r5
  JZ r6, else_0
  DIV r13, r12, r4
  SUB r2, r5, r15
  XOR r13, r31, r0
  JMP endif_1
else_0:
  LDI r4, 480
  LDI r10, 4
  LDI r2, 495
  PSET r4, r10, r2
  LDI r10, 0
  LDI r2, 2813
  LDI r9, 64
  LDI r3, 3036
  LDI r9, 8
  LINE r10, r2, r9, r3, r9
endif_1:
  HALT
