; drawing loop program
; initialization
  LDI r8, 3752
  LDI r3, 0x28FDC5
  LDI r10, 0xB0A591
  LDI r4, 4
  LDI r9, 2
  LDI r7, 2543
  LDI r2, 0xBE8B87
  LDI r5, 2929
; palette
  LDI r6, 0x30DD
  LDI r21, 1
  LDI r1, 0xFF4400
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x44FF00
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x00FF44
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x00FF00
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x00FF44
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x550077
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x0000FF
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x00FFFF
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0xFFFF00
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0x000066
  STORE r6, r1
  ADD r6, r6, r21
  LDI r1, 0xFFEE00
  STORE r6, r1
  ADD r6, r6, r21
main_0:
  ADD r13, r2, r11
  CMP r5, r12
  FRAME
  JMP main_0
