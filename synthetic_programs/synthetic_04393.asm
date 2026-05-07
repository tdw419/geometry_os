; drawing loop program
; initialization
  LDI r7, 2
  LDI r12, 0xDDD196
  LDI r9, 255
  LDI r13, 10
  LDI r11, 8
  LDI r5, 85
  LDI r8, 16
main_0:
  CMP r6, r0
  CMPI r5, 32
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_1
  FRAME
  JMP main_0
