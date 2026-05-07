; input driven program
; initialization
  LDI r14, 256
  LDI r9, 10
  LDI r6, 1953
  LDI r1, 2
  LDI r12, 128
  LDI r13, 3622
main_0:
  IKEY r5
  CMPI r5, 152
  JNZ r5, key_1
  XOR r4, r15, r13
  ANDI r1, r3, 194
  FRAME
  JMP main_0
