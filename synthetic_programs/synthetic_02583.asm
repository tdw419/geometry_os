; input driven program
; initialization
  LDI r11, 8
  LDI r4, 0x6B9250
  LDI r0, 16
main_0:
  SHL r11, r0, r13
  SHL r13, r15, r1
  ANDI r7, r13, 255
  SHL r13, r5, r9
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_1
  LDI r6, 2282
  LDI r5, 255
  LDI r1, 1984
  TEXT r6, r5, r1, "HELLO"
  FRAME
  JMP main_0
