; drawing loop program
; initialization
  LDI r3, 256
  LDI r27, 0x2E3D2C
  LDI r6, 2404
  LDI r9, 8
  LDI r14, 255
  LDI r2, 0x54DCF5
  LDI r1, 3802
main_0:
  LDI r19, 2695
  LDI r8, 0xCF0C5B
  LDI r3, 0
  PSETI
  OR r15, r13, r14
  LDI r12, 731
  LDI r6, 4
  LDI r17, 599
  DRAWTEXT r12, r6, r17, "WORLD"
  FRAME
  JMP main_0
