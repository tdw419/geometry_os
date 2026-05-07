; input driven program
; initialization
  LDI r10, 128
  LDI r0, 1
  LDI r6, 560
main_0:
  LDI r15, 8
  LDI r2, 0xCEED10
  LDI r13, 311
  LDI r7, 719
  CIRCLE r15, r2, r13, r7
  SUB r14, r9, r3
  FRAME
  JMP main_0
