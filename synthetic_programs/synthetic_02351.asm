; counted animation
; initialization
  LDI r3, 0x543E3F
  LDI r11, 0
  LDI r5, 2252
  LDI r7, 256
  LDI r6, 128
  LDI r4, 4
  LDI r0, 0x50760D
loop_0:
  LDI r6, 64
  LDI r14, 285
  LDI r16, 0x5454DC
  LDI r15, 0x28BB22
  LDI r13, 256
  RECTF r6, r14, r16, r15, r13
  LDI r4, 1
  SUB r0, r0, r4
  JNZ r0, loop_0
  HALT
