; input driven program
; initialization
  LDI r1, 8
  LDI r10, 1805
  LDI r15, 109
  LDI r13, 10
  LDI r12, 2841
  LDI r4, 0xC9EE1F
  LDI r0, 0x551C2A
  LDI r14, 256
main_0:
  LDI r6, 128
  LDI r4, 4
  LDI r12, 3338
  DRAWTEXT r6, r4, r12, "WORLD"
  CMPI r13, 64
  LDI r13, 2
  LDI r12, 0xFA3BEA
  LDI r5, 1
  PSETI
  FRAME
  JMP main_0
