; drawing loop program
; initialization
  LDI r12, 10
  LDI r6, 1935
  LDI r13, 2127
  LDI r1, 1475
  LDI r5, 10
main_0:
  LDI r13, 2027
  LDI r0, 8
  LDI r0, 2082
  PSET r13, r0, r0
  LDI r15, 10
  LDI r8, 0x4DD03B
  LDI r10, 8
  PSETI
  ANDI r1, r5, 226
  ANDI r6, r15, 128
  FRAME
  JMP main_0
