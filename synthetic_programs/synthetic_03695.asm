; conditional logic
; initialization
  LDI r2, 2754
  LDI r0, 0x4CBD79
  LDI r9, 1643
  CMP r6, r24
  JNZ r6, else_0
  SUB r2, r5, r1
  MUL r0, r11, r10
  DIV r0, r1, r7
  JMP endif_1
else_0:
  LDI r11, 16
  LDI r14, 10
  LDI r15, 3412
  LDI r2, 3695
  CIRCLE r11, r14, r15, r2
  LDI r9, 2997
  LDI r23, 128
  LDI r15, 1
  WPIXEL
  LDI r1, 4
  LDI r0, 500
  LDI r0, 0x54B9DF
  PSETI
endif_1:
  CMP r13, r0
  JZ r13, else_2
  DIV r10, r14, r2
  SHR r1, r5, r2
  XOR r15, r6, r9
  MUL r11, r23, r12
  JMP endif_3
else_2:
  LDI r9, 4
  LDI r14, 2923
  LDI r7, 1393
  LDI r14, 0xC13D43
  LDI r6, 0x539E06
  RECTF r9, r14, r7, r14, r6
  LDI r2, 1738
  LDI r13, 64
  LDI r18, 64
  PSET r2, r13, r18
endif_3:
  HALT
