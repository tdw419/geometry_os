; counted animation
; initialization
  LDI r14, 0x3F372C
  LDI r0, 0x04B8A1
  LDI r18, 24
loop_0:
  DIV r0, r6, r7
  LDI r15, 560
  FILL r15
  XOR r11, r6, r14
  ANDI r9, r12, 237
  LDI r14, 1
  SUB r18, r18, r14
  JNZ r18, loop_0
  LDI r4, 0x8B1083
loop_1:
  DIV r8, r3, r7
  LDI r23, 1
  SUB r4, r4, r23
  JNZ r4, loop_1
  LDI r7, 0
loop_2:
  DIV r8, r4, r10
  SUBI r15, r9, 85
  LDI r15, 1318
  LDI r12, 256
  LDI r14, 1759
  LDI r11, 1632
  CIRCLE r15, r12, r14, r11
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_2
  HALT
