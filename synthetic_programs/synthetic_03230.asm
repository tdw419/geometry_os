; input driven program
; initialization
  LDI r3, 2944
  LDI r5, 64
  LDI r9, 32
  LDI r11, 0x502D48
  LDI r24, 2000
main_0:
  CMPI r3, 0xEC9CE8
  ANDI r1, r10, 32
  LDI r12, 128
  FILL r12
  FRAME
  JMP main_0
