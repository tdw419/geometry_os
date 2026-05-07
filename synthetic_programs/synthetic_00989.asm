; input driven program
; initialization
  LDI r3, 0x8712D3
  LDI r11, 0x3CFC71
  LDI r1, 1135
  LDI r5, 1
main_0:
  LDI r4, 3117
  LDI r5, 2250
  LDI r11, 0x20A4DB
  DRAWTEXT r4, r5, r11, "WORLD"
  LDI r10, 0xD9EFDD
  FILL r10
  FRAME
  JMP main_0
