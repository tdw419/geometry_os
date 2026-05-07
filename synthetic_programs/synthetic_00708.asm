; input driven program
; initialization
  LDI r5, 1723
  LDI r13, 0
  LDI r1, 256
main_0:
  LDI r11, 0x2D876D
  LDI r15, 1
  LDI r26, 1
  LDI r15, 2184
  LDI r16, 3275
  LINE r11, r15, r26, r15, r16
  LDI r10, 0xA7B1A5
  LDI r1, 2150
  LDI r12, 1530
  TEXT r10, r1, r12, "HELLO"
  SHL r11, r1, r14
  ANDI r4, r1, 255
  FRAME
  JMP main_0
