; drawing loop program
; initialization
  LDI r15, 3929
  LDI r5, 0xD79F46
  LDI r8, 2125
main_0:
  IKEY r6
  CMPI r6, 144
  JNZ r6, key_1
  CMP r8, r7
  CMPI r1, 128
  SUBI r12, r4, 103
  FRAME
  JMP main_0
