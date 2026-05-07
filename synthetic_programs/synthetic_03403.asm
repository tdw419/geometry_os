; drawing loop program
; initialization
  LDI r5, 255
  LDI r20, 2166
  LDI r4, 0xDA4520
  LDI r2, 128
  LDI r9, 0x9FCDF9
  LDI r12, 0
  LDI r0, 1558
  LDI r15, 3214
main_0:
  CMPI r15, r10, 176
  IKEY r15
  CMPI r15, 84
  JNZ r15, key_1
  CMPI r13, r22, 128
  FRAME
  JMP main_0
