; counted animation
; initialization
  LDI r9, 128
  LDI r6, 3892
  LDI r10, 2624
  LDI r4, 2011
  LDI r8, 0xD61967
  LDI r11, 1
loop_0:
  SUBI r19, r4, 256
  LDI r3, 140
  LDI r13, 255
  LDI r10, 0x80EC07
  LDI r31, 3766
  LDI r1, 888
  RECTF r3, r13, r10, r31, r1
  AND r3, r4, r14
  LDI r9, 1
  SUB r11, r11, r9
  JNZ r11, loop_0
  HALT
