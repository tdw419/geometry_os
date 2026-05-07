; drawing loop program
; initialization
  LDI r13, 1
  LDI r9, 0xF60754
  LDI r15, 4055
main_0:
  ADDI r7, r11, 0
  LDI r2, 256
  LDI r1, 256
  LDI r25, 0xDC9F5B
  DRAWTEXT r2, r1, r25, "WORLD"
  IKEY r6
  CMPI r6, 30
  JNZ r6, key_1
  IKEY r2
  CMPI r2, 0
  JNZ r2, key_2
  FRAME
  JMP main_0
