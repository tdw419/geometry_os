; drawing loop program
; initialization
  LDI r6, 956
  LDI r1, 1
  LDI r11, 255
  LDI r13, 338
  LDI r10, 0x05338F
  LDI r7, 32
main_0:
  IKEY r12
  CMPI r12, 0x0D7B82
  JNZ r12, key_1
  CMP r2, r14
  FRAME
  JMP main_0
