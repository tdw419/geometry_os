; drawing loop program
; initialization
  LDI r6, 0x9D6FCF
  LDI r9, 4039
  LDI r12, 256
  LDI r5, 2011
  LDI r3, 16
  LDI r8, 64
  LDI r0, 3059
; palette
  LDI r8, 0x30A4
  LDI r14, 1
  LDI r7, 0xDD0044
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0xFFAA00
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0x0044FF
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0x444444
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0xFF0000
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0x550077
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0x888800
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0x00AAFF
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0xAAFF00
  STORE r8, r7
  ADD r8, r8, r14
  LDI r7, 0xAAAAAA
  STORE r8, r7
  ADD r8, r8, r14
main_0:
  LDI r13, 128
  LDI r9, 1266
  LDI r30, 1416
  LDI r19, 773
  LDI r4, 0xB0A54E
  RECTF r13, r9, r30, r19, r4
  CMP r3, r6
  LDI r4, 0x9D1F0C
  LDI r3, 0xB4D401
  LDI r11, 128
  TEXT r4, r3, r11, "HELLO"
  LDI r4, 256
  LDI r12, 2379
  LDI r2, 0xA1D3D4
  DRAWTEXT r4, r12, r2, "WORLD"
  LDI r7, 1162
  LDI r11, 0x7FC4EA
  LDI r9, 4
  TEXT r7, r11, r9, "HELLO"
  SHR r14, r3, r16
  SHLI r14, r11, 5
  FRAME
  JMP main_0
