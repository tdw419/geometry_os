; input driven program
; initialization
  LDI r1, 38
  LDI r6, 4
  LDI r5, 128
  LDI r11, 64
  LDI r13, 792
  LDI r8, 971
  LDI r28, 2431
  LDI r12, 255
main_0:
  LDI r11, 0xCF0ED6
  FILL r11
  LDI r4, 2647
  LDI r11, 256
  LDI r1, 459
  PSET r4, r11, r1
  FRAME
  JMP main_0
