; input driven program
; initialization
  LDI r6, 1
  LDI r2, 3439
  LDI r11, 3566
  LDI r14, 81
  LDI r24, 383
  LDI r0, 2438
  LDI r7, 2
main_0:
  DIV r9, r13, r1
  LDI r10, 0xC47ED0
  LDI r3, 0xAEB11D
  LDI r4, 3439
  LDI r6, 3368
  CIRCLE r10, r3, r4, r6
  CMP r12, r4
  IKEY r7
  CMPI r7, 171
  JNZ r7, key_1
  SUBI r14, r6, 0xA5782B
  LDI r13, 1963
  LDI r12, 0xB7BFA4
  LDI r23, 3793
  DRAWTEXT r13, r12, r23, "WORLD"
  FRAME
  JMP main_0
