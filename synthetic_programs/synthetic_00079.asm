; input driven program
; initialization
  LDI r1, 256
  LDI r11, 1425
  LDI r14, 1636
  LDI r15, 4
  LDI r13, 1575
main_0:
  LDI r19, 0x47F7D1
  LDI r11, 589
  LDI r15, 0x6A3A22
  PSETI
  LDI r11, 1129
  LDI r14, 1
  LDI r4, 1
  TEXT r11, r14, r4, "HELLO"
  FRAME
  JMP main_0
