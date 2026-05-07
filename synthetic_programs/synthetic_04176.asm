; drawing loop program
; initialization
  LDI r1, 1
  LDI r12, 1
  LDI r14, 128
  LDI r3, 0x4F8B00
  LDI r7, 0xD5F36E
; palette
  LDI r11, 0x238B
  LDI r14, 1
  LDI r7, 0x444444
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x00FFFF
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x888800
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x000000
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x0000CC
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0xFFAA00
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x00FFAA
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x880088
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x0000FF
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0xFF4400
  STORE r11, r7
  ADD r11, r11, r14
  LDI r7, 0x0000FF
  STORE r11, r7
  ADD r11, r11, r14
main_0:
  SHLI r13, r4, 7
  SHL r12, r11, r7
  SHR r15, r0, r8
  SHR r18, r19, r11
  LDI r12, 256
  LDI r14, 255
  LDI r13, 0x1D3678
  DRAWTEXT r12, r14, r13, "WORLD"
  SHR r0, r8, r5
  SHL r26, r10, r11
  FRAME
  JMP main_0
