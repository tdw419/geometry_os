; input driven program
; initialization
  LDI r10, 4
  LDI r1, 0xF11C4D
  LDI r4, 0xF8308E
  LDI r0, 1696
  LDI r2, 8
  LDI r5, 0x0FBBEF
  LDI r15, 16
main_0:
  XOR r15, r14, r1
  XOR r0, r11, r4
  OR r0, r12, r9
  ANDI r11, r4, 10
  LDI r10, 0x973195
  LDI r4, 0xB20E5D
  LDI r7, 10
  PSET r10, r4, r7
  SUBI r4, r9, 23
  ANDI r4, r5, 0
  LDI r15, 0xC2651F
  LDI r7, 1357
  LDI r8, 2957
  DRAWTEXT r15, r7, r8, "WORLD"
  FRAME
  JMP main_0
