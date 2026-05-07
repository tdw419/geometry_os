; drawing loop program
; initialization
  LDI r13, 0xD9540F
  LDI r0, 128
  LDI r4, 32
  LDI r12, 3675
  LDI r8, 740
  LDI r2, 1
; palette
  LDI r5, 0x238E
  LDI r23, 1
  LDI r12, 0xFF0000
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x880088
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x0000CC
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x00FFFF
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x00FFAA
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0xFFAA00
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0xFFEE00
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x00FFFF
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x0000FF
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0xAAFF00
  STORE r5, r12
  ADD r5, r5, r23
  LDI r12, 0x888800
  STORE r5, r12
  ADD r5, r5, r23
main_0:
  LDI r11, 2878
  LDI r8, 0x69F578
  LDI r3, 4
  DRAWTEXT r11, r8, r3, "WORLD"
  MUL r15, r12, r1
  OR r0, r14, r11
  SHLI r7, r12, 0x9CFBF3
  SHL r4, r12, r11
  SHR r12, r0, r13
  XOR r15, r0, r1
  OR r5, r11, r31
  FRAME
  JMP main_0
