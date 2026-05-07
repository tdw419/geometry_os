; drawing loop program
; initialization
  LDI r13, 0x1F679C
  LDI r12, 2225
  LDI r8, 76
  LDI r3, 255
  LDI r15, 1515
  LDI r4, 0x756905
  LDI r6, 2
; palette
  LDI r14, 0x7053
  LDI r10, 1
  LDI r5, 0xFFFF00
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x880088
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x550077
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x44FF00
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x880088
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x0044FF
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x00FFFF
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x00FF00
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0xFF4400
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0x0000FF
  STORE r14, r5
  ADD r14, r14, r10
  LDI r5, 0xFF4400
  STORE r14, r5
  ADD r14, r14, r10
main_0:
  LDI r15, 0xB7FB2A
  LDI r10, 0x8233A9
  LDI r6, 1296
  LDI r3, 0x8F4416
  LDI r5, 4
  RECTF r15, r10, r6, r3, r5
  AND r2, r29, r1
  XOR r3, r4, r10
  LDI r8, 255
  LDI r5, 1
  LDI r12, 3302
  WPIXEL
  SHL r13, r6, r8
  SHL r7, r12, r15
  CMPI r9, r7, 144
  AND r12, r5, r6
  OR r7, r3, r6
  OR r16, r9, r8
  OR r3, r8, r11
  FRAME
  JMP main_0
