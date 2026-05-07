; counted animation
; initialization
  LDI r1, 3334
  LDI r2, 8
  LDI r14, 1
  LDI r5, 1589
  LDI r10, 3678
  LDI r11, 0xF587C5
  LDI r3, 420
  LDI r14, 31
loop_0:
  ANDI r9, r15, 27
  ANDI r15, r7, 0x75A9E7
  LDI r31, 1
  SUB r14, r14, r31
  JNZ r14, loop_0
  HALT
