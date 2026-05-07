; drawing loop program
; initialization
  LDI r7, 2798
  LDI r5, 10
  LDI r4, 0xE6311B
  LDI r11, 0xD99E03
  LDI r13, 0x22A1B2
  LDI r12, 128
; palette
  LDI r5, 0x2257
  LDI r8, 1
  LDI r6, 0x00FF00
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xDD0044
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x000000
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xDD0044
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x0000FF
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xAAAAAA
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x0000CC
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xDD0044
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xAAAAAA
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x444444
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xAA00AA
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x008888
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0xDD0044
  STORE r5, r6
  ADD r5, r5, r8
  LDI r6, 0x0000CC
  STORE r5, r6
  ADD r5, r5, r8
main_0:
  CMPI r4, 151
  SHLI r0, r6, 0xDB4590
  SHLI r0, r8, 0xEBFDED
  SAR r13, r14, r24
  AND r2, r14, r11
  OR r5, r2, r13
  AND r3, r31, r8
  FRAME
  JMP main_0
