; counted animation
; initialization
  LDI r13, 3271
  LDI r15, 1723
  LDI r3, 0xB2506D
  LDI r4, 0xC3FF83
  LDI r11, 16
  LDI r9, 10
  LDI r22, 0x8A9288
  LDI r10, 0x8ACEAE
loop_0:
  SHR r1, r9, r2
  MUL r1, r5, r8
  LDI r2, 0xB2A75F
  LDI r2, 0x264D79
  LDI r9, 0x33AF2A
  LDI r6, 4
  LDI r2, 10
  LINE r2, r2, r9, r6, r2
  LDI r14, 0
  LDI r5, 3680
  LDI r3, 0x84F7AB
  LDI r27, 806
  CIRCLE r14, r5, r3, r27
  LDI r14, 1
  SUB r10, r10, r14
  JNZ r10, loop_0
  LDI r2, 0xB69AAB
loop_1:
  AND r12, r9, r11
  LDI r24, 0
  LDI r5, 3623
  LDI r13, 1
  LDI r15, 0xFBE194
  LDI r13, 0
  RECTF r24, r5, r13, r15, r13
  ADDI r6, r3, 255
  LDI r0, 1
  SUB r2, r2, r0
  JNZ r2, loop_1
  HALT
