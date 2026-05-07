; drawing loop program
; initialization
  LDI r29, 16
  LDI r12, 0x15DAC5
  LDI r2, 0x2AEB8E
  LDI r11, 0xE948C3
; palette
  LDI r7, 0x20B2
  LDI r4, 1
  LDI r12, 0x00FF44
  STORE r7, r12
  ADD r7, r7, r4
  LDI r12, 0xAAFF00
  STORE r7, r12
  ADD r7, r7, r4
  LDI r12, 0xFF00FF
  STORE r7, r12
  ADD r7, r7, r4
  LDI r12, 0x00FF00
  STORE r7, r12
  ADD r7, r7, r4
main_0:
  CMPI r9, r7, 1
  ANDI r4, r2, 0xD44E06
  FRAME
  JMP main_0
