; counted animation
; initialization
  LDI r2, 4009
  LDI r0, 3328
  LDI r3, 16
  LDI r15, 0x778A47
  LDI r4, 3600
  LDI r11, 1941
  LDI r8, 1391
  LDI r5, 2
loop_0:
  LDI r6, 2236
  LDI r4, 1
  LDI r15, 255
  WPIXEL
  LDI r7, 1
  SUB r5, r5, r7
  JNZ r5, loop_0
  HALT
