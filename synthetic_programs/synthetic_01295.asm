; drawing loop program
; initialization
  LDI r12, 642
  LDI r0, 964
  LDI r3, 2657
  LDI r2, 678
  LDI r5, 96
  LDI r9, 0xB90DC9
  LDI r13, 0x135499
; palette
  LDI r9, 0x20B2
  LDI r8, 1
  LDI r4, 0xAAFF00
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x0044FF
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0xFFFFFF
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x8800FF
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x00FFFF
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x444444
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x444444
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0xFF8800
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0xFFEE00
  STORE r9, r4
  ADD r9, r9, r8
  LDI r4, 0x00FF00
  STORE r9, r4
  ADD r9, r9, r8
main_0:
  SUBI r1, r15, 0x6DD2DD
  SAR r1, r13, r3
  SHL r8, r26, r6
  SAR r25, r0, r13
  XOR r14, r1, r9
  AND r6, r5, r10
  OR r11, r10, r12
  AND r1, r12, r7
  ADD r3, r16, r12
  FRAME
  JMP main_0
