; drawing loop program
; initialization
  LDI r8, 3872
  LDI r9, 0x688E4E
  LDI r14, 0xF91AF1
  LDI r2, 128
; palette
  LDI r10, 0x2199
  LDI r2, 1
  LDI r0, 0xFF8800
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xFFAA00
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0x0000FF
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0x880088
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xAA00AA
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xAA00AA
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xFF8800
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r2
  LDI r0, 0xFFEE00
  STORE r10, r0
  ADD r10, r10, r2
main_0:
  AND r3, r0, r2
  OR r4, r11, r13
  XOR r4, r3, r10
  CMPI r5, r28, 0x83A079
  CMPI r8, 243
  FRAME
  JMP main_0
