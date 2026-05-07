; drawing loop program
; initialization
  LDI r8, 1078
  LDI r2, 8
  LDI r5, 3970
main_0:
  CMPI r6, 0x7C8CA4
  LDI r14, 861
  LDI r10, 0xC3B03E
  LDI r10, 482
  DRAWTEXT r14, r10, r10, "WORLD"
  CMP r7, r10
  ANDI r1, r3, 194
  FRAME
  JMP main_0
