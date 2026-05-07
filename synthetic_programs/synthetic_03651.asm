; counted animation
; initialization
  LDI r2, 1113
  LDI r4, 0x198731
  LDI r12, 0x1DB285
  LDI r11, 4084
  LDI r7, 0x03FAF8
loop_0:
  SUBI r11, r10, 0x324CA7
  CMPI r10, r8, 0xF02B27
  ADD r15, r6, r10
  ANDI r9, r2, 136
  LDI r6, 1
  SUB r7, r7, r6
  JNZ r7, loop_0
  HALT
