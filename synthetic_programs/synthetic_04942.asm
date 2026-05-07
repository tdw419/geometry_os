; drawing loop program
; initialization
  LDI r3, 64
  LDI r10, 903
  LDI r5, 3417
  LDI r2, 255
; palette
  LDI r3, 0x6001
  LDI r12, 1
  LDI r10, 0x00AAFF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x8800FF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x0044FF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0xAA00AA
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x00AAFF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x000000
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x888800
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x880088
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x8800FF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0xFF4400
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0xDD0044
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x008888
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x00AAFF
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0x888800
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0xFFAA00
  STORE r3, r10
  ADD r3, r3, r12
  LDI r10, 0xFFAA00
  STORE r3, r10
  ADD r3, r3, r12
main_0:
  LDI r11, 622
  FILL r11
  LDI r12, 128
  LDI r11, 1
  LDI r9, 206
  LDI r15, 255
  LDI r10, 0x681F3F
  RECTF r12, r11, r9, r15, r10
  LDI r14, 0x08F973
  LDI r12, 2716
  LDI r7, 8
  LDI r16, 10
  LDI r6, 231
  LINE r14, r12, r7, r16, r6
  FRAME
  JMP main_0
