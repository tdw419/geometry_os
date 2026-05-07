; input driven program
; initialization
  LDI r15, 0xF6CAEE
  LDI r14, 255
  LDI r10, 4
main_0:
  LDI r26, 10
  LDI r14, 2069
  LDI r4, 10
  DRAWTEXT r26, r14, r4, "WORLD"
  AND r1, r15, r4
  OR r6, r0, r5
  XOR r12, r13, r6
  OR r12, r10, r0
  AND r8, r1, r10
  CMP r4, r5
  DIV r7, r0, r5
  IKEY r13
  CMPI r13, 128
  JNZ r13, key_1
  FRAME
  JMP main_0
