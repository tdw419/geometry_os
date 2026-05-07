; input driven program
; initialization
  LDI r9, 4
  LDI r12, 3008
main_0:
  LDI r10, 3886
  LDI r9, 0xC0DB2D
  LDI r2, 0x034BEF
  DRAWTEXT r10, r9, r2, "WORLD"
  CMPI r10, 16
  SUBI r5, r13, 0xB2C7DC
  IKEY r6
  CMPI r6, 0xAABD79
  JNZ r6, key_1
  LDI r12, 0x2E9D1E
  LDI r5, 3821
  LDI r6, 1222
  DRAWTEXT r12, r5, r6, "WORLD"
  XOR r26, r8, r3
  XOR r8, r12, r2
  FRAME
  JMP main_0
