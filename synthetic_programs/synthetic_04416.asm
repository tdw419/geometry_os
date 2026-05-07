; drawing loop program
; initialization
  LDI r2, 8
  LDI r10, 8
  LDI r7, 0x579127
  LDI r6, 0x187FD2
  LDI r4, 3051
  LDI r15, 0
  LDI r5, 0x47181A
  LDI r13, 0x65FFF2
; palette
  LDI r7, 0x2180
  LDI r1, 1
  LDI r11, 0x8800FF
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x00AAFF
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x444444
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x00FF44
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x888800
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0xDD0044
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x008888
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x0000CC
  STORE r7, r11
  ADD r7, r7, r1
  LDI r11, 0x000000
  STORE r7, r11
  ADD r7, r7, r1
main_0:
  IKEY r6
  CMPI r6, 149
  JNZ r6, key_1
  MOD r8, r12, r9
  IKEY r3
  CMPI r3, 0xBE9C1D
  JNZ r3, key_2
  SUBI r2, r5, 0x98B8C9
  FRAME
  JMP main_0
