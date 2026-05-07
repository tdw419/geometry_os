; drawing loop program
; initialization
  LDI r9, 152
  LDI r4, 0xDAD6FE
  LDI r11, 0
  LDI r7, 128
  LDI r1, 2952
main_0:
  LDI r17, 505
  LDI r7, 0xF9A64F
  LDI r3, 59
  DRAWTEXT r17, r7, r3, "WORLD"
  IKEY r2
  CMPI r2, 123
  JNZ r2, key_1
  FRAME
  JMP main_0
