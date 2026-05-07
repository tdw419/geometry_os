; conditional logic
; initialization
  LDI r3, 1178
  LDI r11, 1472
  LDI r2, 2202
  LDI r0, 1207
  LDI r8, 3560
  LDI r6, 3777
  LDI r7, 10
  CMP r10, r13
  JZ r10, else_0
  SHL r0, r25, r5
  DIV r7, r14, r29
  XOR r17, r4, r26
  SUB r14, r3, r6
  JMP endif_1
else_0:
  LDI r6, 2929
  LDI r1, 2111
  LDI r10, 770
  LDI r29, 64
  CIRCLE r6, r1, r10, r29
endif_1:
  HALT
