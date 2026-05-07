; input driven program
; initialization
  LDI r10, 16
  LDI r13, 255
  LDI r1, 3872
main_0:
  XOR r0, r7, r10
  AND r0, r9, r3
  AND r13, r2, r6
  SAR r14, r9, r2
  SHL r3, r15, r14
  FRAME
  JMP main_0
