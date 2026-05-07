; input driven program
; initialization
  LDI r0, 888
  LDI r3, 4094
  LDI r11, 0xCCBA27
  LDI r2, 2466
  LDI r5, 255
  LDI r4, 679
main_0:
  LDI r3, 708
  LDI r8, 0x5CEE16
  LDI r6, 4
  LDI r12, 0x45DDBE
  LDI r2, 0x6114B1
  RECTF r3, r8, r6, r12, r2
  CMPI r13, 2
  SUBI r14, r1, 255
  FRAME
  JMP main_0
