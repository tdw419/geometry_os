; input driven program
; initialization
  LDI r6, 3358
  LDI r9, 256
  LDI r1, 2267
  LDI r0, 4
  LDI r4, 128
main_0:
  IKEY r10
  CMPI r10, 32
  JNZ r10, key_1
  AND r14, r15, r12
  XOR r20, r10, r1
  FRAME
  JMP main_0
