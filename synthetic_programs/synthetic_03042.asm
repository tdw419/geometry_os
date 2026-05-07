; drawing loop program
; initialization
  LDI r7, 3328
  LDI r4, 0
  LDI r11, 0xA8EBE1
  LDI r13, 64
  LDI r2, 3889
  LDI r12, 0xB292CF
main_0:
  LDI r7, 0xA89EDB
  LDI r5, 575
  LDI r9, 2926
  DRAWTEXT r7, r5, r9, "WORLD"
  LDI r10, 3085
  LDI r1, 1676
  LDI r0, 32
  DRAWTEXT r10, r1, r0, "WORLD"
  CMPI r21, 4
  CMP r11, r14
  FRAME
  JMP main_0
