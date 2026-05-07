; drawing loop program
; initialization
  LDI r15, 3228
  LDI r2, 0x1FF1C3
  LDI r1, 32
  LDI r30, 8
  LDI r13, 1491
  LDI r14, 2193
  LDI r8, 0x8A3EBD
; palette
  LDI r14, 0x21A5
  LDI r9, 1
  LDI r8, 0xFF0000
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0xDD0044
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0xFFFFFF
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0x0000CC
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0xFFFFFF
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0xAAFF00
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0xAAAAAA
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0x00FFFF
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0x008888
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0x00FFFF
  STORE r14, r8
  ADD r14, r14, r9
  LDI r8, 0x888800
  STORE r14, r8
  ADD r14, r14, r9
main_0:
  LDI r2, 0x50FBF5
  LDI r15, 2118
  LDI r6, 255
  TEXT r2, r15, r6, "HELLO"
  SUBI r10, r29, 0x6B5588
  AND r15, r12, r1
  AND r3, r10, r9
  AND r6, r14, r15
  OR r11, r0, r7
  FRAME
  JMP main_0
