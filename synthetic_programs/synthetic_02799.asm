; counted animation
; initialization
  LDI r12, 0xE07740
  LDI r9, 3711
  LDI r1, 128
  LDI r13, 0xF4F293
  LDI r6, 255
  LDI r29, 8
loop_0:
  LDI r7, 0x2835B1
  LDI r6, 3390
  LDI r13, 116
  LDI r6, 1753
  CIRCLE r7, r6, r13, r6
  LDI r14, 1
  SUB r29, r29, r14
  JNZ r29, loop_0
  HALT
