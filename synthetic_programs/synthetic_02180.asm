; input driven program
; initialization
  LDI r10, 32
  LDI r2, 4
  LDI r4, 1964
  LDI r15, 0xD6C7D3
main_0:
  ANDI r11, r4, 0
  IKEY r5
  CMPI r5, 225
  JNZ r5, key_1
  FRAME
  JMP main_0
