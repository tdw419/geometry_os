; drawing loop program
; initialization
  LDI r9, 256
  LDI r15, 0x7C995B
  LDI r3, 0x1A326E
  LDI r4, 2
  LDI r14, 1538
  LDI r13, 10
  LDI r2, 0x7D4DF4
  LDI r8, 0x12698D
main_0:
  CMPI r7, 0xFE675F
  CMPI r14, 32
  IKEY r2
  CMPI r2, 255
  JNZ r2, key_1
  FRAME
  JMP main_0
