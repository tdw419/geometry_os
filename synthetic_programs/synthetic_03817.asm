; input driven program
; initialization
  LDI r2, 64
  LDI r0, 10
  LDI r6, 3530
  LDI r15, 0
  LDI r9, 3074
  LDI r8, 1027
  LDI r7, 4
main_0:
  OR r30, r2, r12
  AND r21, r7, r3
  SUBI r2, r10, 168
  CMPI r7, 2
  LDI r10, 128
  LDI r2, 3456
  LDI r15, 1598
  WPIXEL
  LDI r6, 2074
  LDI r2, 8
  LDI r1, 0x1416C3
  DRAWTEXT r6, r2, r1, "WORLD"
  FRAME
  JMP main_0
