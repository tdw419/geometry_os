; drawing loop program
; initialization
  LDI r2, 0x82753F
  LDI r0, 2
  LDI r11, 128
; palette
  LDI r15, 0x23DB
  LDI r4, 1
  LDI r7, 0x00AAFF
  STORE r15, r7
  ADD r15, r15, r4
  LDI r7, 0xFF4400
  STORE r15, r7
  ADD r15, r15, r4
  LDI r7, 0x000000
  STORE r15, r7
  ADD r15, r15, r4
  LDI r7, 0xFF4400
  STORE r15, r7
  ADD r15, r15, r4
  LDI r7, 0xDD0044
  STORE r15, r7
  ADD r15, r15, r4
  LDI r7, 0xFF0000
  STORE r15, r7
  ADD r15, r15, r4
main_0:
  OR r9, r7, r14
  OR r3, r5, r1
  XOR r4, r0, r9
  SUBI r2, r29, 0x65B1D5
  FRAME
  JMP main_0
