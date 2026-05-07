; drawing loop program
; initialization
  LDI r14, 0xEBEFF8
  LDI r7, 8
  LDI r15, 16
  LDI r13, 4
  LDI r3, 3895
  LDI r0, 0x7FD0A0
  LDI r5, 1373
  LDI r10, 10
; palette
  LDI r7, 0x60BB
  LDI r11, 1
  LDI r12, 0xFF00FF
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFFFFFF
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xAAFF00
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x0000FF
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFFEE00
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFF8800
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFF0000
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFFAA00
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xFFAA00
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x00FFAA
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x444444
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0xAA00AA
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x008888
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x0044FF
  STORE r7, r12
  ADD r7, r7, r11
  LDI r12, 0x0000FF
  STORE r7, r12
  ADD r7, r7, r11
main_0:
  ANDI r6, r12, 256
  XOR r10, r26, r9
  LDI r13, 0x165324
  LDI r29, 1456
  LDI r11, 8
  PSET r13, r29, r11
  FRAME
  JMP main_0
