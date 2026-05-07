; input driven program
; initialization
  LDI r11, 0x078F0E
  LDI r1, 106
  LDI r4, 0x2B5FE0
main_0:
  AND r4, r12, r9
  SUBI r5, r12, 222
  FRAME
  JMP main_0
