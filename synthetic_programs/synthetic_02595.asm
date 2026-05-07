; drawing loop program
; initialization
  LDI r6, 0xFB7087
  LDI r11, 3536
  LDI r5, 64
  LDI r10, 3126
; palette
  LDI r0, 0x220A
  LDI r7, 1
  LDI r11, 0xDD0044
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xFF0000
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xFFAA00
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xAAAAAA
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0x00FFAA
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xDD0044
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0x0000CC
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0x880088
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xAAFF00
  STORE r0, r11
  ADD r0, r0, r7
  LDI r11, 0xAAFF00
  STORE r0, r11
  ADD r0, r0, r7
main_0:
  XOR r4, r3, r5
  OR r4, r12, r10
  XOR r9, r2, r11
  SHLI r0, r7, 2
  SHR r1, r13, r14
  SHLI r6, r3, 6
  SHL r11, r8, r7
  OR r15, r2, r9
  SUBI r14, r3, 255
  FRAME
  JMP main_0
