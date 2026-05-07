; drawing loop program
; initialization
  LDI r10, 1465
  LDI r9, 1085
  LDI r15, 1010
  LDI r13, 0x7664B2
  LDI r3, 0x1D60E7
  LDI r7, 0x667715
  LDI r2, 843
; palette
  LDI r25, 0x20DA
  LDI r8, 1
  LDI r4, 0xAA00AA
  STORE r25, r4
  ADD r25, r25, r8
  LDI r4, 0xFF0000
  STORE r25, r4
  ADD r25, r25, r8
  LDI r4, 0xFFFFFF
  STORE r25, r4
  ADD r25, r25, r8
  LDI r4, 0xFF8800
  STORE r25, r4
  ADD r25, r25, r8
  LDI r4, 0xDD0044
  STORE r25, r4
  ADD r25, r25, r8
main_0:
  ANDI r5, r10, 249
  LDI r0, 125
  LDI r10, 8
  LDI r7, 0x94E596
  TEXT r0, r10, r7, "HELLO"
  LDI r15, 3012
  LDI r14, 3960
  LDI r2, 32
  TEXT r15, r14, r2, "HELLO"
  SHL r11, r9, r6
  SHL r6, r10, r1
  SHLI r9, r18, 0x61813D
  CMP r4, r13
  SHLI r1, r2, 5
  SHL r0, r8, r2
  FRAME
  JMP main_0
