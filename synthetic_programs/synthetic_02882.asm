; drawing loop program
; initialization
  LDI r11, 3619
  LDI r15, 0xC3F389
  LDI r13, 8
  LDI r10, 10
  LDI r4, 1
; palette
  LDI r11, 0x2123
  LDI r9, 1
  LDI r15, 0xFF8800
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x8800FF
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x550077
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0xAAAAAA
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x00FFAA
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x00FF44
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x880088
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0x880088
  STORE r11, r15
  ADD r11, r11, r9
  LDI r15, 0xFFFFFF
  STORE r11, r15
  ADD r11, r11, r9
main_0:
  LDI r5, 0xEB65CC
  LDI r10, 3411
  LDI r0, 823
  DRAWTEXT r5, r10, r0, "WORLD"
  CMPI r7, r8, 0x650715
  IKEY r4
  CMPI r4, 0x968CAA
  JNZ r4, key_1
  FRAME
  JMP main_0
