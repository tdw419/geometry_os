; input driven program
; initialization
  LDI r15, 64
  LDI r4, 3578
  LDI r10, 2518
  LDI r13, 0x2D5BAC
main_0:
  SUBI r12, r15, 128
  SHR r14, r7, r11
  LDI r13, 4
  LDI r12, 2125
  LDI r15, 1788
  DRAWTEXT r13, r12, r15, "WORLD"
  FRAME
  JMP main_0
