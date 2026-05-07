; input driven program
; initialization
  LDI r8, 1672
  LDI r3, 1
main_0:
  IKEY r9
  CMPI r9, 160
  JNZ r9, key_1
  AND r6, r8, r9
  XOR r8, r13, r5
  XOR r2, r0, r6
  AND r13, r4, r6
  XOR r7, r6, r12
  CMPI r12, 256
  OR r12, r4, r15
  FRAME
  JMP main_0
