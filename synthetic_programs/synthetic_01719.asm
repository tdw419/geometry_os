; drawing loop program
; initialization
  LDI r11, 0x5FCED2
  LDI r6, 0x4071D8
  LDI r25, 0x51D1D6
  LDI r20, 450
; palette
  LDI r11, 0x60AE
  LDI r13, 1
  LDI r7, 0x008888
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xAA00AA
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x0044FF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xAAAAAA
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x8800FF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xFFEE00
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x000066
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x00FFAA
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x000000
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xAAAAAA
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x00AAFF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x00AAFF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xFFFFFF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xFFFFFF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x00FF44
  STORE r11, r7
  ADD r11, r11, r13
main_0:
  MUL r4, r5, r7
  AND r13, r12, r10
  LDI r8, 2671
  LDI r1, 2629
  LDI r8, 1054
  DRAWTEXT r8, r1, r8, "WORLD"
  XOR r2, r3, r7
  AND r4, r24, r0
  FRAME
  JMP main_0
