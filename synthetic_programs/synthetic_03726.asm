; input driven program
; initialization
  LDI r14, 0x104F81
  LDI r15, 10
main_0:
  SHLI r3, r10, 0xA73081
  SHL r0, r10, r4
  OR r2, r6, r10
  OR r6, r9, r14
  OR r4, r15, r5
  CMP r17, r1
  LDI r8, 0x52499B
  LDI r3, 0x7B0498
  LDI r8, 819
  DRAWTEXT r8, r3, r8, "WORLD"
  ANDI r6, r3, 0x7E5525
  FRAME
  JMP main_0
