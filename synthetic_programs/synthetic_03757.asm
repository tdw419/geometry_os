; drawing loop program
; initialization
  LDI r4, 4
  LDI r2, 128
  LDI r12, 1223
  LDI r13, 0x2B225A
; palette
  LDI r6, 0x4009
  LDI r5, 1
  LDI r14, 0x00FFAA
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x0000FF
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x888800
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xAA00AA
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x00FF44
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x00FFAA
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x00FF00
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xFFEE00
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xAAFF00
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0x880088
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xDD0044
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xAA00AA
  STORE r6, r14
  ADD r6, r6, r5
  LDI r14, 0xAA00AA
  STORE r6, r14
  ADD r6, r6, r5
main_0:
  IKEY r12
  CMPI r12, 220
  JNZ r12, key_1
  CMPI r5, r7, 176
  FRAME
  JMP main_0
