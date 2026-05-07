; drawing loop program
; initialization
  LDI r14, 0x941FEF
  LDI r10, 0x22D45B
  LDI r4, 3355
; palette
  LDI r2, 0x7059
  LDI r12, 1
  LDI r11, 0x0000CC
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFFEE00
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xAAFF00
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF4400
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xAA00AA
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xDD0044
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x00AAFF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x444444
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x00FFFF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFF00FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x008888
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xAAAAAA
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x0000CC
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0xFFEE00
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x8800FF
  STORE r2, r11
  ADD r2, r2, r12
  LDI r11, 0x00FFFF
  STORE r2, r11
  ADD r2, r2, r12
main_0:
  ANDI r17, r8, 2
  ANDI r4, r3, 0xD0C177
  LDI r8, 128
  FILL r8
  FRAME
  JMP main_0
