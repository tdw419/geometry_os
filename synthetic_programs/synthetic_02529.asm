; drawing loop program
; initialization
  LDI r7, 3592
  LDI r2, 0xD0C2DC
  LDI r10, 4
  LDI r5, 255
  LDI r6, 8
  LDI r12, 128
; palette
  LDI r2, 0x231D
  LDI r3, 1
  LDI r25, 0x550077
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0x444444
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0x0000CC
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xDD0044
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFFFFFF
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0x00FF44
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFF4400
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xAAAAAA
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0x888800
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0x00FFAA
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFFFFFF
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFFAA00
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFF8800
  STORE r2, r25
  ADD r2, r2, r3
  LDI r25, 0xFF0000
  STORE r2, r25
  ADD r2, r2, r3
main_0:
  IKEY r12
  CMPI r12, 0x0F5DC2
  JNZ r12, key_1
  LDI r1, 0xF74B8D
  LDI r4, 2
  LDI r10, 16
  TEXT r1, r4, r10, "HELLO"
  IKEY r8
  CMPI r8, 0
  JNZ r8, key_2
  SHLI r9, r12, 64
  SHLI r1, r2, 8
  FRAME
  JMP main_0
