; input driven program
; initialization
  LDI r14, 994
  LDI r2, 16
  LDI r3, 4
main_0:
  CMP r1, r9
  SHR r6, r12, r7
  SHL r7, r8, r6
  CMP r9, r10
  CMPI r14, r4, 4
  OR r0, r13, r30
  OR r0, r6, r9
  IKEY r6
  CMPI r6, 0x46728D
  JNZ r6, key_1
  FRAME
  JMP main_0
