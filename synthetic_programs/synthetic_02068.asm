; input driven program
; initialization
  LDI r7, 1105
  LDI r2, 0xBCE47B
main_0:
  LDI r15, 0x22FFA4
  LDI r6, 0x4160B0
  LDI r12, 0
  LDI r5, 1525
  CIRCLE r15, r6, r12, r5
  CMPI r0, r3, 0x80FA63
  LDI r0, 32
  LDI r10, 0x5CD9F4
  LDI r2, 1730
  DRAWTEXT r0, r10, r2, "WORLD"
  IKEY r14
  CMPI r14, 0x3E53F2
  JNZ r14, key_1
  IKEY r15
  CMPI r15, 8
  JNZ r15, key_2
  CMP r14, r15
  FRAME
  JMP main_0
