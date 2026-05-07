; input driven program
; initialization
  LDI r1, 0xE4C922
  LDI r7, 3300
  LDI r5, 243
main_0:
  IKEY r1
  CMPI r1, 256
  JNZ r1, key_1
  SHR r11, r2, r8
  FRAME
  JMP main_0
