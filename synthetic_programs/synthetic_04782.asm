; drawing loop program
; initialization
  LDI r12, 0xBB70AF
  LDI r11, 0x9A06E6
  LDI r10, 256
; palette
  LDI r30, 0x3005
  LDI r4, 1
  LDI r12, 0xFF0000
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x00FFAA
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x00FFAA
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x0044FF
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0xFF0000
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0xAAFF00
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x8800FF
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0xFFAA00
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x888800
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x00FF00
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0xFF0000
  STORE r30, r12
  ADD r30, r30, r4
  LDI r12, 0x0044FF
  STORE r30, r12
  ADD r30, r30, r4
main_0:
  LDI r2, 16
  LDI r3, 8
  LDI r13, 0x292FCB
  PSET r2, r3, r13
  CMPI r9, 214
  AND r5, r26, r15
  OR r7, r11, r3
  XOR r8, r14, r11
  CMPI r15, r13, 5
  FRAME
  JMP main_0
