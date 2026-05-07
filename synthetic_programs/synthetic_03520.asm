; drawing loop program
; initialization
  LDI r3, 4
  LDI r13, 4
  LDI r8, 1723
  LDI r2, 255
  LDI r14, 8
  LDI r16, 1
; palette
  LDI r6, 0x22AD
  LDI r2, 1
  LDI r11, 0xFFFF00
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0xFF4400
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x0044FF
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x0000CC
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x888800
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x44FF00
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x000066
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x00FFAA
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x0000FF
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0xAAAAAA
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x000000
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0xFFAA00
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0xAA00AA
  STORE r6, r11
  ADD r6, r6, r2
  LDI r11, 0x880088
  STORE r6, r11
  ADD r6, r6, r2
main_0:
  LDI r2, 10
  FILL r2
  XOR r15, r29, r7
  XOR r13, r8, r26
  XOR r12, r0, r1
  FRAME
  JMP main_0
