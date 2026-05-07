; input driven program
; initialization
  LDI r1, 3442
  LDI r3, 612
  LDI r12, 1603
  LDI r4, 3713
main_0:
  ANDI r9, r11, 0x8B800C
  IKEY r0
  CMPI r0, 167
  JNZ r0, key_1
  SUBI r13, r15, 0xFD313F
  FRAME
  JMP main_0
