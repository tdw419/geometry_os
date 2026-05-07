; input driven program
; initialization
  LDI r1, 256
  LDI r12, 1999
  LDI r10, 753
  LDI r27, 2
  LDI r2, 1422
  LDI r14, 2107
  LDI r13, 16
main_0:
  IKEY r1
  CMPI r1, 0x06AC3C
  JNZ r1, key_1
  LDI r9, 2487
  LDI r4, 1994
  LDI r7, 0xC4533A
  DRAWTEXT r9, r4, r7, "WORLD"
  SUBI r10, r21, 119
  CMPI r13, 0x034CD1
  XOR r13, r5, r2
  SUB r1, r10, r14
  FRAME
  JMP main_0
