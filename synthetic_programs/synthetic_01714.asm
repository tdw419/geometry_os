; drawing loop program
; initialization
  LDI r2, 2428
  LDI r15, 1944
main_0:
  IKEY r13
  CMPI r13, 16
  JNZ r13, key_1
  CMPI r6, r13, 32
  FRAME
  JMP main_0
