; input driven program
; initialization
  LDI r9, 0x3F3F45
  LDI r11, 654
  LDI r1, 1615
main_0:
  SHLI r9, r0, 1
  SHLI r8, r13, 0x115DD1
  LDI r1, 2
  LDI r13, 64
  LDI r9, 0x1A6A9E
  DRAWTEXT r1, r13, r9, "WORLD"
  FRAME
  JMP main_0
