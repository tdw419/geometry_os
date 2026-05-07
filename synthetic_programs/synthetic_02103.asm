; drawing loop program
; initialization
  LDI r8, 3620
  LDI r6, 2
  LDI r3, 64
; palette
  LDI r8, 0x50B6
  LDI r6, 1
  LDI r11, 0x008888
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0x00FFAA
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0xFFAA00
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0xFF0000
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0x8800FF
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0x00FFFF
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0xFFFF00
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0xFFFFFF
  STORE r8, r11
  ADD r8, r8, r6
  LDI r11, 0x550077
  STORE r8, r11
  ADD r8, r8, r6
main_0:
  IKEY r0
  CMPI r0, 107
  JNZ r0, key_1
  SAR r14, r13, r7
  SHL r4, r1, r9
  SHL r13, r2, r1
  SHLI r2, r8, 3
  CMP r8, r15
  LDI r13, 0x1421AB
  LDI r4, 0x8E144D
  LDI r15, 0x77C0BD
  TEXT r13, r4, r15, "HELLO"
  AND r7, r25, r11
  AND r7, r0, r3
  OR r2, r6, r12
  AND r13, r5, r15
  FRAME
  JMP main_0
