; input driven program
; initialization
  LDI r0, 2557
  LDI r4, 128
  LDI r8, 0x707D2F
  LDI r14, 2335
  LDI r13, 0x1241BD
main_0:
  CMPI r6, r13, 80
  CMPI r2, 177
  AND r13, r9, r1
  OR r4, r1, r9
  XOR r6, r8, r5
  OR r10, r8, r5
  LDI r6, 2
  LDI r14, 0
  LDI r15, 255
  LDI r3, 128
  CIRCLE r6, r14, r15, r3
  FRAME
  JMP main_0
