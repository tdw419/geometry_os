; drawing loop program
; initialization
  LDI r9, 3635
  LDI r12, 378
  LDI r15, 0
  LDI r4, 128
main_0:
  LDI r1, 3691
  LDI r0, 128
  LDI r15, 0x6A6FB9
  DRAWTEXT r1, r0, r15, "WORLD"
  IKEY r5
  CMPI r5, 193
  JNZ r5, key_1
  ANDI r1, r0, 38
  MUL r9, r10, r18
  FRAME
  JMP main_0
