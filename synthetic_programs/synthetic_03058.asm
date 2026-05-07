; drawing loop program
; initialization
  LDI r9, 1377
  LDI r14, 8
; palette
  LDI r13, 0x221D
  LDI r0, 1
  LDI r2, 0x444444
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0xFFAA00
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0x8800FF
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0xFFAA00
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0x0000CC
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0xFF8800
  STORE r13, r2
  ADD r13, r13, r0
  LDI r2, 0x008888
  STORE r13, r2
  ADD r13, r13, r0
main_0:
  LDI r2, 32
  LDI r29, 0x5F45E4
  LDI r9, 1
  PSETI
  SHL r11, r6, r14
  FRAME
  JMP main_0
