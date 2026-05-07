; input driven program
; initialization
  LDI r1, 4
  LDI r4, 1549
  LDI r15, 576
  LDI r27, 1988
  LDI r9, 1
  LDI r10, 1756
main_0:
  CMP r15, r0
  MOD r15, r7, r27
  CMPI r8, 0x2979A8
  XOR r5, r7, r9
  FRAME
  JMP main_0
