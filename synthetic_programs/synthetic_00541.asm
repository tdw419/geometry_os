; mixed program
; initialization
  LDI r21, 3462
  LDI r11, 0x273BE5
  LDI r14, 32
; palette
  LDI r12, 0x303D
  LDI r5, 1
  LDI r11, 0x888800
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x00FF00
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x000000
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0xDD0044
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0xFFEE00
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x0000CC
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x00FF44
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x00FFFF
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x0000CC
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0xFF8800
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x880088
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x444444
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0xAAAAAA
  STORE r12, r11
  ADD r12, r12, r5
  LDI r11, 0x00FFFF
  STORE r12, r11
  ADD r12, r12, r5
  LDI r0, 0x0202AC
  LDI r5, 1051
  LDI r8, 1
  TEXT r0, r5, r8, "HELLO"
  SHR r3, r18, r8
  SAR r6, r7, r3
  SHR r3, r15, r12
  LDI r13, 0xA9DA3A
loop_0:
  LDI r14, 255
  LDI r0, 0x326AED
  LDI r2, 0xE3F9A4
  PSET r14, r0, r2
  LDI r0, 1
  SUB r13, r13, r0
  JNZ r13, loop_0
  HALT
