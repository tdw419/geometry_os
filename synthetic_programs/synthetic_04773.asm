; drawing loop program
; initialization
  LDI r10, 256
  LDI r13, 0xDC7191
  LDI r2, 1592
  LDI r4, 1
  LDI r15, 2542
  LDI r9, 0x1700EC
  LDI r1, 2
main_0:
  ADDI r8, r28, 0x1D985B
  XOR r12, r14, r13
  AND r6, r14, r18
  OR r10, r1, r18
  CMP r6, r7
  CMPI r0, r14, 0
  FRAME
  JMP main_0
