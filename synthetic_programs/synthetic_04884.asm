; drawing loop program
; initialization
  LDI r2, 0x7A525A
  LDI r7, 425
  LDI r15, 128
  LDI r1, 1491
; palette
  LDI r2, 0x24D8
  LDI r11, 1
  LDI r14, 0x00FFAA
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0x444444
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xFFFFFF
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xFFFFFF
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xFFEE00
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0x44FF00
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xAAAAAA
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xAA00AA
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0x0000CC
  STORE r2, r14
  ADD r2, r2, r11
  LDI r14, 0xFF8800
  STORE r2, r14
  ADD r2, r2, r11
main_0:
  SUBI r30, r15, 238
  LDI r10, 0x786E35
  LDI r7, 0x912535
  LDI r14, 139
  PSETI
  SHLI r6, r4, 5
  SAR r10, r3, r12
  LDI r12, 0x911FD7
  LDI r31, 0x36FA90
  LDI r3, 10
  PSET r12, r31, r3
  XOR r7, r0, r1
  XOR r17, r12, r9
  AND r7, r8, r9
  FRAME
  JMP main_0
