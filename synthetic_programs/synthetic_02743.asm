; drawing loop program
; initialization
  LDI r14, 0x193F94
  LDI r4, 0xC0B95B
; palette
  LDI r6, 0x4032
  LDI r12, 1
  LDI r8, 0x444444
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x008888
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x880088
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0xAAFF00
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x00FFFF
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0xAA00AA
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x880088
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x880088
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0x00FFAA
  STORE r6, r8
  ADD r6, r6, r12
  LDI r8, 0xAAFF00
  STORE r6, r8
  ADD r6, r6, r12
main_0:
  SHR r1, r3, r15
  SHR r14, r11, r25
  CMPI r5, r10, 98
  OR r5, r0, r2
  XOR r13, r3, r2
  FRAME
  JMP main_0
