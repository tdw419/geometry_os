; drawing loop program
; initialization
  LDI r15, 0
  LDI r7, 0x5B1384
  LDI r9, 156
  LDI r23, 2546
  LDI r3, 2977
main_0:
  IKEY r9
  CMPI r9, 0x48F57F
  JNZ r9, key_1
  ANDI r2, r13, 231
  ANDI r14, r3, 0x73EE4F
  FRAME
  JMP main_0
