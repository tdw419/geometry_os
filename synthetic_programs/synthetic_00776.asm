; drawing loop program
; initialization
  LDI r8, 0xB85DB1
  LDI r7, 1
; palette
  LDI r5, 0x40B1
  LDI r15, 1
  LDI r0, 0x880088
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0xFFEE00
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x444444
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x0044FF
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x550077
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x444444
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x00FFAA
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x8800FF
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0xFFEE00
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x000000
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x00FF44
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x00FFFF
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x00FFAA
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0x000000
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0xFF0000
  STORE r5, r0
  ADD r5, r5, r15
  LDI r0, 0xFFEE00
  STORE r5, r0
  ADD r5, r5, r15
main_0:
  CMPI r3, r22, 0x9B2075
  LDI r6, 0xB5A783
  LDI r11, 0
  LDI r11, 0x81DCFB
  LDI r0, 2154
  LDI r4, 3911
  LINE r6, r11, r11, r0, r4
  CMPI r1, 1
  FRAME
  JMP main_0
