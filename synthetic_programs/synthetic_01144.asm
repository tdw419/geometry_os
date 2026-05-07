; counted animation
; initialization
  LDI r2, 64
  LDI r11, 2484
  LDI r10, 2
loop_0:
  SUBI r9, r4, 0xF14EB3
  ANDI r5, r13, 10
  LDI r20, 1
  SUB r10, r10, r20
  JNZ r10, loop_0
  HALT
