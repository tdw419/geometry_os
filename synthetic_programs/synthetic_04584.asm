; drawing loop program
; initialization
  LDI r7, 1361
  LDI r1, 0x177433
  LDI r11, 0xE385E2
  LDI r13, 32
  LDI r10, 0x348F84
  LDI r3, 3460
  LDI r5, 293
; palette
  LDI r1, 0x24C8
  LDI r11, 1
  LDI r10, 0x00FF44
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xFF8800
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0x444444
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xFF8800
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0x00FF44
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xAAFF00
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0x880088
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0x00FF00
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xFF8800
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0x0000FF
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xDD0044
  STORE r1, r10
  ADD r1, r1, r11
  LDI r10, 0xFF8800
  STORE r1, r10
  ADD r1, r1, r11
main_0:
  LDI r14, 0
  LDI r13, 971
  LDI r7, 558
  TEXT r14, r13, r7, "HELLO"
  ADDI r10, r13, 0xD1EC26
  CMPI r5, 255
  ADD r13, r29, r11
  XOR r11, r6, r3
  FRAME
  JMP main_0
