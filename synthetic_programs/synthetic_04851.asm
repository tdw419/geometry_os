; drawing loop program
; initialization
  LDI r8, 2173
  LDI r12, 0xE3F4D6
  LDI r14, 2828
  LDI r3, 1
  LDI r4, 2371
  LDI r0, 1
; palette
  LDI r10, 0x246D
  LDI r7, 1
  LDI r0, 0x00AAFF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x000000
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x444444
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x000000
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x8800FF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0xAAFF00
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x0000FF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x00FFAA
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x008888
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x0000FF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0xFF8800
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x00AAFF
  STORE r10, r0
  ADD r10, r10, r7
  LDI r0, 0x444444
  STORE r10, r0
  ADD r10, r10, r7
main_0:
  SUBI r12, r3, 155
  LDI r1, 1149
  LDI r7, 3047
  LDI r18, 3279
  TEXT r1, r7, r18, "HELLO"
  CMP r15, r5
  LDI r1, 0x0082A4
  LDI r0, 1
  LDI r2, 0x6D113D
  DRAWTEXT r1, r0, r2, "WORLD"
  AND r7, r11, r3
  XOR r3, r11, r9
  XOR r11, r0, r2
  OR r8, r12, r0
  FRAME
  JMP main_0
