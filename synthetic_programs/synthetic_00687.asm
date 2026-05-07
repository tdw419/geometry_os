; counted animation
; initialization
  LDI r14, 4
  LDI r4, 4047
  LDI r5, 255
loop_0:
  LDI r1, 255
  LDI r3, 1337
  LDI r2, 3231
  WPIXEL
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_0
  HALT
