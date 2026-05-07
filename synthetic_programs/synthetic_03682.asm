; input driven program
; initialization
  LDI r10, 3067
  LDI r2, 16
  LDI r5, 3983
main_0:
  LDI r7, 1242
  FILL r7
  CMPI r13, r0, 74
  OR r12, r10, r14
  OR r1, r26, r14
  OR r8, r14, r10
  CMPI r6, 8
  IKEY r4
  CMPI r4, 4
  JNZ r4, key_1
  FRAME
  JMP main_0
