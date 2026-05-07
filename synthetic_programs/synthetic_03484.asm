; drawing loop program
; initialization
  LDI r3, 1
  LDI r5, 10
  LDI r11, 0x49EFF5
; palette
  LDI r3, 0x30D6
  LDI r9, 1
  LDI r12, 0x00FFAA
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x000000
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xDD0044
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xFF00FF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x8800FF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x000066
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x0000CC
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x008888
  STORE r3, r12
  ADD r3, r3, r9
main_0:
  CMPI r3, r9, 255
  LDI r9, 255
  LDI r12, 0x12E3D9
  LDI r1, 32
  DRAWTEXT r9, r12, r1, "WORLD"
  LDI r5, 0
  LDI r7, 1080
  LDI r14, 128
  TEXT r5, r7, r14, "HELLO"
  SUBI r4, r15, 0xB7CCF5
  LDI r15, 2410
  LDI r0, 128
  LDI r4, 0xB5FA93
  DRAWTEXT r15, r0, r4, "WORLD"
  FRAME
  JMP main_0
