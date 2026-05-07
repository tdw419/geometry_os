; drawing loop program
; initialization
  LDI r0, 497
  LDI r7, 0xD348ED
main_0:
  IKEY r9
  CMPI r9, 194
  JNZ r9, key_1
  SUBI r8, r12, 16
  FRAME
  JMP main_0
