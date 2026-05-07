; input driven program
; initialization
  LDI r1, 0x9EB2C9
  LDI r2, 2281
  LDI r6, 1952
main_0:
  LDI r15, 255
  LDI r15, 1606
  LDI r4, 10
  TEXT r15, r15, r4, "HELLO"
  SAR r2, r9, r6
  SHLI r2, r13, 256
  SHLI r0, r6, 255
  OR r7, r3, r1
  AND r3, r10, r4
  AND r22, r7, r10
  FRAME
  JMP main_0
