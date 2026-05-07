; drawing loop program
; initialization
  LDI r3, 0x7A28D0
  LDI r9, 256
  LDI r12, 0x047160
  LDI r5, 4
  LDI r11, 0xD03D4D
; palette
  LDI r15, 0x70C0
  LDI r6, 1
  LDI r10, 0xFFFFFF
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x000000
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x0000CC
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x0000FF
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xFFFFFF
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xDD0044
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xFF0000
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x550077
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xFFFF00
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x44FF00
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xAAAAAA
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x0000CC
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x000000
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0x0044FF
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xFFAA00
  STORE r15, r10
  ADD r15, r15, r6
  LDI r10, 0xFFAA00
  STORE r15, r10
  ADD r15, r15, r6
main_0:
  LDI r15, 32
  LDI r5, 0x2F1E3C
  LDI r2, 0x5C186D
  DRAWTEXT r15, r5, r2, "WORLD"
  SUBI r7, r15, 208
  ADD r14, r2, r10
  AND r10, r9, r2
  FRAME
  JMP main_0
