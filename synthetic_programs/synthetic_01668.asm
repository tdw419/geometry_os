; drawing loop program
; initialization
  LDI r10, 802
  LDI r13, 4087
; palette
  LDI r2, 0x603A
  LDI r1, 1
  LDI r5, 0x0000FF
  STORE r2, r5
  ADD r2, r2, r1
  LDI r5, 0x00FFAA
  STORE r2, r5
  ADD r2, r2, r1
  LDI r5, 0xFF00FF
  STORE r2, r5
  ADD r2, r2, r1
  LDI r5, 0xAAFF00
  STORE r2, r5
  ADD r2, r2, r1
  LDI r5, 0x008888
  STORE r2, r5
  ADD r2, r2, r1
main_0:
  LDI r11, 0x09AC1B
  LDI r6, 0x13BD92
  LDI r9, 4
  LDI r12, 2477
  LDI r4, 0x582CD7
  LINE r11, r6, r9, r12, r4
  LDI r5, 485
  LDI r4, 0xFBCA0D
  LDI r13, 1
  TEXT r5, r4, r13, "HELLO"
  CMPI r5, r15, 8
  ANDI r7, r11, 192
  FRAME
  JMP main_0
