; counted animation
; initialization
  LDI r7, 0xD61B25
  LDI r15, 3415
  LDI r24, 1338
  LDI r13, 0xBDB732
  LDI r6, 255
  LDI r14, 64
  LDI r1, 3336
  LDI r11, 40
loop_0:
  ANDI r10, r2, 2
  SUBI r7, r15, 0
  LDI r10, 1
  SUB r11, r11, r10
  JNZ r11, loop_0
  LDI r4, 2
loop_1:
  ADD r14, r6, r11
  ADD r0, r1, r12
  LDI r4, 1607
  FILL r4
  SHL r13, r2, r0
  LDI r6, 1
  SUB r4, r4, r6
  JNZ r4, loop_1
  HALT
