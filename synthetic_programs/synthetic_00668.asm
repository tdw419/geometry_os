; drawing loop program
; initialization
  LDI r22, 578
  LDI r10, 256
  LDI r15, 0x06B72E
  LDI r11, 128
  LDI r1, 1
  LDI r4, 256
  LDI r3, 1992
; palette
  LDI r7, 0x22E6
  LDI r11, 1
  LDI r8, 0x00FFFF
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x00FFAA
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0xFF0000
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x444444
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x000066
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x0000CC
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x8800FF
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x888800
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x00FFFF
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x0044FF
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x880088
  STORE r7, r8
  ADD r7, r7, r11
  LDI r8, 0x444444
  STORE r7, r8
  ADD r7, r7, r11
main_0:
  SHL r7, r5, r15
  SHL r15, r4, r14
  AND r10, r14, r25
  AND r12, r3, r8
  OR r10, r4, r13
  FRAME
  JMP main_0
