; input driven program
; initialization
  LDI r13, 253
  LDI r7, 572
main_0:
  IKEY r15
  CMPI r15, 32
  JNZ r15, key_1
  MUL r0, r9, r5
  FRAME
  JMP main_0
