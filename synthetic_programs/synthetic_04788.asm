; drawing loop program
; initialization
  LDI r6, 290
  LDI r9, 0x3DB379
  LDI r11, 0x987E14
  LDI r10, 0xE786B2
  LDI r13, 2196
  LDI r8, 2435
  LDI r12, 0
  LDI r29, 2
; palette
  LDI r7, 0x6058
  LDI r14, 1
  LDI r5, 0xAAAAAA
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x880088
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x0044FF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x0044FF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFFFF00
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x550077
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x000000
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x00FFAA
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFFFFFF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x8800FF
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xAA00AA
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x888800
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xFF8800
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0x550077
  STORE r7, r5
  ADD r7, r7, r14
  LDI r5, 0xAA00AA
  STORE r7, r5
  ADD r7, r7, r14
main_0:
  CMP r13, r2
  CMPI r27, 64
  CMP r5, r3
  FRAME
  JMP main_0
