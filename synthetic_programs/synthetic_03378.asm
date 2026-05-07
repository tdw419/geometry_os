; drawing loop program
; initialization
  LDI r11, 0x22C5B1
  LDI r12, 2770
  LDI r6, 884
  LDI r25, 1408
; palette
  LDI r9, 0x7006
  LDI r8, 1
  LDI r14, 0x550077
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0x000000
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0xFFFFFF
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0xFFEE00
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0xFFFFFF
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0x008888
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0x0000FF
  STORE r9, r14
  ADD r9, r9, r8
  LDI r14, 0xFF8800
  STORE r9, r14
  ADD r9, r9, r8
main_0:
  CMPI r14, r9, 0x2FD20F
  OR r9, r2, r3
  FRAME
  JMP main_0
