; input driven program
; initialization
  LDI r13, 1961
  LDI r14, 255
  LDI r15, 16
main_0:
  SHL r1, r12, r16
  SAR r2, r13, r14
  SAR r8, r15, r7
  IKEY r12
  CMPI r12, 0x038663
  JNZ r12, key_1
  IKEY r4
  CMPI r4, 246
  JNZ r4, key_2
  SAR r8, r10, r4
  SHL r9, r10, r12
  SHR r7, r10, r0
  SHL r5, r19, r1
  OR r5, r13, r2
  FRAME
  JMP main_0
