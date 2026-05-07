; drawing loop program
; initialization
  LDI r2, 1
  LDI r14, 2055
  LDI r7, 265
  LDI r1, 775
  LDI r15, 0x2CEF3C
  LDI r13, 2827
  LDI r9, 4
; palette
  LDI r1, 0x6055
  LDI r9, 1
  LDI r30, 0xFF00FF
  STORE r1, r30
  ADD r1, r1, r9
  LDI r30, 0xFF00FF
  STORE r1, r30
  ADD r1, r1, r9
  LDI r30, 0x00FFAA
  STORE r1, r30
  ADD r1, r1, r9
  LDI r30, 0xAA00AA
  STORE r1, r30
  ADD r1, r1, r9
  LDI r30, 0x000066
  STORE r1, r30
  ADD r1, r1, r9
main_0:
  CMPI r7, r21, 32
  IKEY r3
  CMPI r3, 64
  JNZ r3, key_1
  FRAME
  JMP main_0
