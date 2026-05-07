; input driven program
; initialization
  LDI r13, 4
  LDI r4, 0xF75FCC
  LDI r7, 2
main_0:
  LDI r0, 0x8ED906
  LDI r13, 0x390E5E
  LDI r3, 0x8726B0
  DRAWTEXT r0, r13, r3, "WORLD"
  SUBI r7, r6, 128
  ANDI r14, r13, 0x3D662D
  FRAME
  JMP main_0
