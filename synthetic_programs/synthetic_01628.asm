; drawing loop program
; initialization
  LDI r4, 3826
  LDI r13, 128
  LDI r5, 0xC32A0D
  LDI r10, 0x7AC4C9
  LDI r14, 2
  LDI r8, 0x639927
; palette
  LDI r6, 0x2229
  LDI r14, 1
  LDI r3, 0x000066
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0xFFEE00
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0xFFEE00
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0x00FFFF
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0x000066
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0x880088
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0x888800
  STORE r6, r3
  ADD r6, r6, r14
  LDI r3, 0xFF8800
  STORE r6, r3
  ADD r6, r6, r14
main_0:
  CMPI r4, 128
  AND r12, r5, r11
  AND r5, r6, r0
  XOR r7, r12, r14
  OR r10, r0, r1
  CMPI r9, r13, 37
  FRAME
  JMP main_0
