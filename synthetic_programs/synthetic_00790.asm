; drawing loop program
; initialization
  LDI r18, 0x23ADAA
  LDI r12, 2467
  LDI r26, 3704
  LDI r15, 10
main_0:
  ADD r15, r3, r13
  IKEY r4
  CMPI r4, 82
  JNZ r4, key_1
  LDI r1, 1585
  LDI r4, 10
  LDI r1, 0xA50686
  DRAWTEXT r1, r4, r1, "WORLD"
  FRAME
  JMP main_0
