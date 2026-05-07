; drawing loop program
; initialization
  LDI r15, 3907
  LDI r2, 1
main_0:
  IKEY r24
  CMPI r24, 255
  JNZ r24, key_1
  ADD r0, r6, r1
  FRAME
  JMP main_0
