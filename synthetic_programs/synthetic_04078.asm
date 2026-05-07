; drawing loop program
; initialization
  LDI r14, 0x6DFE86
  LDI r8, 839
  LDI r7, 10
  LDI r4, 0x2171B5
  LDI r9, 696
  LDI r15, 0x45BB15
main_0:
  XOR r14, r7, r15
  IKEY r13
  CMPI r13, 99
  JNZ r13, key_1
  MUL r1, r13, r2
  FRAME
  JMP main_0
