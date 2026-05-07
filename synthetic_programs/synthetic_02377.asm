; drawing loop program
; initialization
  LDI r9, 0x94B390
  LDI r1, 0x88B080
  LDI r3, 1692
; palette
  LDI r7, 0x40A1
  LDI r14, 1
  LDI r11, 0x888800
  STORE r7, r11
  ADD r7, r7, r14
  LDI r11, 0x550077
  STORE r7, r11
  ADD r7, r7, r14
  LDI r11, 0x000000
  STORE r7, r11
  ADD r7, r7, r14
  LDI r11, 0x44FF00
  STORE r7, r11
  ADD r7, r7, r14
  LDI r11, 0x00FFFF
  STORE r7, r11
  ADD r7, r7, r14
main_0:
  IKEY r13
  CMPI r13, 128
  JNZ r13, key_1
  CMPI r7, r15, 0
  IKEY r4
  CMPI r4, 4
  JNZ r4, key_2
  LDI r6, 32
  LDI r5, 0x9D2208
  LDI r15, 0x93059F
  TEXT r6, r5, r15, "HELLO"
  AND r10, r30, r5
  OR r15, r6, r13
  AND r10, r3, r4
  OR r12, r7, r5
  FRAME
  JMP main_0
