; drawing loop program
; initialization
  LDI r14, 0x744C1F
  LDI r25, 2641
  LDI r7, 0xE3A162
  LDI r4, 0
  LDI r6, 3791
  LDI r3, 1
  LDI r8, 0
  LDI r13, 3681
; palette
  LDI r8, 0x60D9
  LDI r2, 1
  LDI r9, 0xAAAAAA
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x000066
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x00AAFF
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x008888
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x00FF44
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x550077
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x0044FF
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x888800
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0xFFFFFF
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x444444
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0xFFAA00
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0x8800FF
  STORE r8, r9
  ADD r8, r8, r2
  LDI r9, 0xAAAAAA
  STORE r8, r9
  ADD r8, r8, r2
main_0:
  IKEY r1
  CMPI r1, 0x664748
  JNZ r1, key_1
  SHL r11, r5, r7
  SHL r5, r4, r10
  SAR r10, r16, r15
  FRAME
  JMP main_0
