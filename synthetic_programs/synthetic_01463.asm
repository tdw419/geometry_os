; input driven program
; initialization
  LDI r3, 0x2ABCC4
  LDI r13, 2854
  LDI r1, 84
main_0:
  ANDI r4, r14, 16
  LDI r9, 1725
  LDI r12, 640
  LDI r3, 0xD8BB06
  LDI r1, 10
  LDI r8, 0xFD9ADC
  LINE r9, r12, r3, r1, r8
  XOR r11, r4, r9
  AND r4, r5, r13
  LDI r4, 0xF8425E
  LDI r2, 372
  LDI r14, 0xCBA629
  LDI r13, 0x659D78
  LDI r4, 0x20B1CE
  LINE r4, r2, r14, r13, r4
  FRAME
  JMP main_0
