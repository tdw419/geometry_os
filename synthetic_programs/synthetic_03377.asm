; drawing loop program
; initialization
  LDI r6, 52
  LDI r12, 0x71AC8C
  LDI r11, 189
  LDI r3, 1542
  LDI r5, 0x3075FF
  LDI r26, 0x0DD4CC
  LDI r4, 1
; palette
  LDI r11, 0x602E
  LDI r3, 1
  LDI r1, 0x0000FF
  STORE r11, r1
  ADD r11, r11, r3
  LDI r1, 0x00FF00
  STORE r11, r1
  ADD r11, r11, r3
  LDI r1, 0x0000CC
  STORE r11, r1
  ADD r11, r11, r3
  LDI r1, 0xAA00AA
  STORE r11, r1
  ADD r11, r11, r3
  LDI r1, 0xFFFF00
  STORE r11, r1
  ADD r11, r11, r3
  LDI r1, 0xFF00FF
  STORE r11, r1
  ADD r11, r11, r3
main_0:
  CMPI r3, r0, 0xEEEDDB
  CMPI r2, 32
  SHLI r0, r8, 8
  SHR r0, r2, r9
  SAR r2, r5, r11
  ANDI r12, r9, 0x99D030
  FRAME
  JMP main_0
