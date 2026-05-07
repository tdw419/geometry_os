; input driven program
; initialization
  LDI r10, 0x394748
  LDI r9, 0x383659
  LDI r24, 8
main_0:
  LDI r11, 0
  LDI r10, 0xD9A6A8
  LDI r2, 0xEBE6FD
  LDI r9, 1575
  LDI r1, 128
  LINE r11, r10, r2, r9, r1
  CMPI r7, r14, 174
  LDI r14, 0xBEF4F4
  LDI r1, 2
  LDI r4, 0xE71680
  PSET r14, r1, r4
  FRAME
  JMP main_0
