; drawing loop program
; initialization
  LDI r4, 1090
  LDI r0, 10
  LDI r14, 1
  LDI r3, 16
; palette
  LDI r8, 0x209A
  LDI r7, 1
  LDI r9, 0x00AAFF
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0x44FF00
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0x00AAFF
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0xFF00FF
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0xFF4400
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0x880088
  STORE r8, r9
  ADD r8, r8, r7
  LDI r9, 0x8800FF
  STORE r8, r9
  ADD r8, r8, r7
main_0:
  IKEY r3
  CMPI r3, 0x245BAF
  JNZ r3, key_1
  LDI r4, 3447
  LDI r5, 597
  LDI r2, 0x6E75DB
  PSET r4, r5, r2
  FRAME
  JMP main_0
