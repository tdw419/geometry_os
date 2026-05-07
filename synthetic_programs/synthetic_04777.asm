; input driven program
; initialization
  LDI r15, 3679
  LDI r9, 996
  LDI r8, 3167
  LDI r3, 10
  LDI r0, 0xBC90D5
main_0:
  LDI r1, 255
  LDI r13, 612
  LDI r22, 0
  PSET r1, r13, r22
  ADDI r13, r0, 2
  XOR r30, r20, r5
  OR r15, r12, r13
  AND r13, r15, r24
  OR r0, r4, r14
  IKEY r1
  CMPI r1, 16
  JNZ r1, key_1
  LDI r9, 0x4ECAF3
  LDI r9, 0x8BD507
  LDI r1, 3393
  PSETI
  FRAME
  JMP main_0
