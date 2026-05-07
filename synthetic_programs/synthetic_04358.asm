; drawing loop program
; initialization
  LDI r13, 3227
  LDI r1, 256
  LDI r8, 1485
main_0:
  ADDI r2, r8, 0xB198C5
  CMPI r17, 0x84C5CD
  IKEY r6
  CMPI r6, 140
  JNZ r6, key_1
  FRAME
  JMP main_0
