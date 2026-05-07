; input driven program
; initialization
  LDI r7, 128
  LDI r6, 255
  LDI r3, 949
  LDI r18, 20
  LDI r15, 2
main_0:
  CMP r0, r1
  AND r15, r6, r1
  LDI r5, 255
  LDI r2, 1885
  LDI r12, 0xE437DC
  TEXT r5, r2, r12, "HELLO"
  ANDI r8, r13, 76
  FRAME
  JMP main_0
