; input driven program
; initialization
  LDI r1, 3966
  LDI r28, 1624
  LDI r9, 255
  LDI r10, 2
main_0:
  LDI r2, 32
  FILL r2
  AND r10, r14, r6
  AND r13, r8, r4
  OR r4, r8, r6
  FRAME
  JMP main_0
