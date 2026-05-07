; drawing loop program
; initialization
  LDI r30, 328
  LDI r10, 2085
  LDI r0, 10
  LDI r5, 0x08A8ED
  LDI r9, 0x3440A6
  LDI r8, 128
  LDI r6, 0x858A34
  LDI r15, 0xC33988
; palette
  LDI r4, 0x2117
  LDI r2, 1
  LDI r19, 0x444444
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x000066
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x550077
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFF4400
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFF0000
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFF4400
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x000066
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFFEE00
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xAAFF00
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFFEE00
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xAAAAAA
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xFFFFFF
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0xAAFF00
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x0044FF
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x00FFFF
  STORE r4, r19
  ADD r4, r4, r2
  LDI r19, 0x880088
  STORE r4, r19
  ADD r4, r4, r2
main_0:
  IKEY r9
  CMPI r9, 0x49E441
  JNZ r9, key_1
  LDI r9, 128
  LDI r11, 0x5E2D91
  LDI r2, 1089
  DRAWTEXT r9, r11, r2, "WORLD"
  LDI r12, 1217
  FILL r12
  LDI r11, 0x7BFE88
  LDI r7, 0
  LDI r13, 255
  DRAWTEXT r11, r7, r13, "WORLD"
  FRAME
  JMP main_0
