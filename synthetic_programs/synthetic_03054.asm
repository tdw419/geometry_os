; drawing loop program
; initialization
  LDI r1, 3572
  LDI r11, 0xBCF38C
  LDI r8, 0x987157
  LDI r10, 10
  LDI r13, 2133
  LDI r16, 699
  LDI r0, 32
  LDI r5, 1775
; palette
  LDI r1, 0x232F
  LDI r14, 1
  LDI r4, 0xFF8800
  STORE r1, r4
  ADD r1, r1, r14
  LDI r4, 0x00FFAA
  STORE r1, r4
  ADD r1, r1, r14
  LDI r4, 0xFFAA00
  STORE r1, r4
  ADD r1, r1, r14
  LDI r4, 0x008888
  STORE r1, r4
  ADD r1, r1, r14
main_0:
  SHR r11, r8, r1
  SAR r2, r13, r31
  SHR r13, r11, r3
  SHL r13, r0, r12
  SHLI r8, r12, 6
  SHR r11, r7, r2
  SHLI r6, r12, 0x1BC48E
  SHR r6, r11, r7
  FRAME
  JMP main_0
