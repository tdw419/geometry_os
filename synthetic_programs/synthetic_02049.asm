; counted animation
; initialization
  LDI r7, 0
  LDI r0, 256
  LDI r5, 1
  LDI r10, 4
loop_0:
  LDI r15, 0x333666
  LDI r28, 0x641291
  LDI r13, 256
  WPIXEL
  SUBI r11, r13, 38
  LDI r0, 1
  SUB r10, r10, r0
  JNZ r10, loop_0
  LDI r0, 23
loop_1:
  DIV r11, r0, r2
  MUL r14, r8, r7
  LDI r23, 1
  SUB r0, r0, r23
  JNZ r0, loop_1
  HALT
