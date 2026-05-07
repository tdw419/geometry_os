; input driven program
; initialization
  LDI r4, 0x985272
  LDI r5, 255
  LDI r1, 0x48A30D
  LDI r12, 0
  LDI r6, 64
main_0:
  IKEY r10
  CMPI r10, 255
  JNZ r10, key_1
  SHL r18, r9, r3
  SHR r7, r22, r15
  LDI r13, 0xC95FF5
  LDI r10, 2950
  LDI r10, 188
  DRAWTEXT r13, r10, r10, "WORLD"
  FRAME
  JMP main_0
