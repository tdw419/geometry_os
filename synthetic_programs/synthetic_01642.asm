; counted animation
; initialization
  LDI r11, 0x7D4A11
  LDI r27, 0x393602
  LDI r4, 992
  LDI r1, 2581
  LDI r3, 0x160FC7
  LDI r10, 16
  LDI r7, 0x695B29
  LDI r6, 0x590A69
  LDI r9, 0x191296
loop_0:
  ANDI r13, r12, 0x4EFB67
  CMPI r8, r9, 0x3BDD9A
  MUL r0, r7, r13
  CMPI r3, r15, 0xF1F57F
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_0
  LDI r3, 0x2ED6E5
loop_1:
  LDI r12, 923
  FILL r12
  SHL r10, r9, r22
  LDI r12, 1
  SUB r3, r3, r12
  JNZ r3, loop_1
  LDI r6, 24
loop_2:
  DIV r14, r6, r7
  LDI r0, 1
  SUB r6, r6, r0
  JNZ r6, loop_2
  HALT
