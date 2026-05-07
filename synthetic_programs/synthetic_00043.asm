; input driven program
; initialization
  LDI r4, 1513
  LDI r5, 0xEF14CD
main_0:
  LDI r8, 2649
  LDI r2, 0x1FF13D
  LDI r10, 8
  TEXT r8, r2, r10, "HELLO"
  AND r22, r5, r3
  FRAME
  JMP main_0
