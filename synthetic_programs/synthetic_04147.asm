; counted animation
; initialization
  LDI r14, 8
  LDI r6, 2
  LDI r2, 0x9B5F38
  LDI r12, 0xF8891C
  LDI r9, 5
loop_0:
  ADDI r7, r1, 0x1DDA29
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_0
  LDI r2, 10
loop_1:
  LDI r4, 16
  LDI r4, 3416
  LDI r1, 2522
  LDI r24, 0x5E4F8D
  CIRCLE r4, r4, r1, r24
  ADDI r14, r3, 8
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_1
  LDI r13, 32
loop_2:
  LDI r3, 0xECBFC9
  LDI r12, 0xA14D63
  LDI r5, 2604
  WPIXEL
  ADDI r12, r13, 236
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_2
  HALT
