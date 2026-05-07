; input driven program
; initialization
  LDI r3, 0xC414B0
  LDI r9, 0xFC36B1
  LDI r4, 8
main_0:
  IKEY r7
  CMPI r7, 0
  JNZ r7, key_1
  LDI r11, 570
  FILL r11
  IKEY r0
  CMPI r0, 32
  JNZ r0, key_2
  CMPI r13, 0
  FRAME
  JMP main_0
