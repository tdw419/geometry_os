; input driven program
; initialization
  LDI r9, 256
  LDI r11, 1741
main_0:
  CMP r9, r13
  CMP r9, r4
  LDI r9, 10
  LDI r14, 3507
  LDI r6, 0xB9D914
  LDI r14, 798
  CIRCLE r9, r14, r6, r14
  LDI r11, 993
  LDI r1, 256
  LDI r9, 1
  DRAWTEXT r11, r1, r9, "WORLD"
  FRAME
  JMP main_0
