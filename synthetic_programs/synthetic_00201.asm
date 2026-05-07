; input driven program
; initialization
  LDI r0, 0x67D466
  LDI r1, 3330
  LDI r9, 32
main_0:
  OR r1, r9, r7
  AND r15, r1, r14
  OR r8, r7, r9
  IKEY r12
  CMPI r12, 4
  JNZ r12, key_1
  CMPI r5, 113
  FRAME
  JMP main_0
