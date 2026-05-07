; drawing loop program
; initialization
  LDI r14, 32
  LDI r2, 64
  LDI r5, 0x1B59C2
; palette
  LDI r1, 0x22BA
  LDI r11, 1
  LDI r12, 0x444444
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x0044FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x550077
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x00FF44
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x444444
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x550077
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF0000
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFFFF00
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x550077
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF00FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFFFF00
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xAA00AA
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x880088
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x444444
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x0000FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF8800
  STORE r1, r12
  ADD r1, r1, r11
main_0:
  SAR r5, r3, r12
  SHLI r11, r7, 1
  SHR r13, r6, r10
  SHL r7, r9, r8
  IKEY r7
  CMPI r7, 149
  JNZ r7, key_1
  LDI r3, 10
  LDI r0, 16
  LDI r11, 0x3B7D24
  DRAWTEXT r3, r0, r11, "WORLD"
  FRAME
  JMP main_0
