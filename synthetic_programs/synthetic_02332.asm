; input driven program
; initialization
  LDI r10, 0xA8354C
  LDI r13, 2442
  LDI r9, 215
  LDI r6, 0x7694C1
  LDI r14, 1653
  LDI r1, 0x9FA3AE
main_0:
  LDI r14, 3222
  LDI r15, 0xD1F466
  LDI r8, 16
  DRAWTEXT r14, r15, r8, "WORLD"
  LDI r23, 0x7EF9F0
  LDI r15, 64
  LDI r13, 8
  LDI r0, 0x135979
  CIRCLE r23, r15, r13, r0
  LDI r8, 1243
  LDI r8, 256
  LDI r5, 465
  DRAWTEXT r8, r8, r5, "WORLD"
  ADD r6, r9, r18
  FRAME
  JMP main_0
