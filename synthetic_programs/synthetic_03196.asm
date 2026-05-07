; drawing loop program
; initialization
  LDI r15, 128
  LDI r7, 0xA69B68
  LDI r1, 0x31C8BC
main_0:
  ANDI r3, r9, 10
  LDI r13, 32
  LDI r2, 2689
  LDI r15, 0xC8AAF7
  PSET r13, r2, r15
  LDI r12, 1845
  LDI r6, 1503
  LDI r14, 104
  TEXT r12, r6, r14, "HELLO"
  FRAME
  JMP main_0
