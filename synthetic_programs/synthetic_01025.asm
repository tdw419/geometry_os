; drawing loop program
; initialization
  LDI r10, 2
  LDI r11, 2703
  LDI r14, 0
  LDI r5, 0
  LDI r2, 0
  LDI r1, 256
  LDI r6, 3953
; palette
  LDI r2, 0x800A
  LDI r16, 1
  LDI r29, 0x00FFFF
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0x00FF00
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0xFFAA00
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0x008888
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0x0044FF
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0xFF8800
  STORE r2, r29
  ADD r2, r2, r16
  LDI r29, 0x00AAFF
  STORE r2, r29
  ADD r2, r2, r16
main_0:
  LDI r10, 8
  FILL r10
  LDI r3, 0x8185B5
  LDI r11, 169
  LDI r2, 32
  TEXT r3, r11, r2, "HELLO"
  ANDI r2, r15, 10
  FRAME
  JMP main_0
