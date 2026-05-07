; drawing loop program
; initialization
  LDI r12, 32
  LDI r11, 64
  LDI r1, 3168
  LDI r7, 1215
  LDI r0, 4
  LDI r14, 0xBE8EE6
  LDI r4, 32
  LDI r5, 0xC3666A
; palette
  LDI r14, 0x70FA
  LDI r11, 1
  LDI r1, 0x550077
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x0000FF
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x0044FF
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0xFF4400
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x880088
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0xFFFFFF
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x00FFFF
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x000000
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x44FF00
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0xDD0044
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x0000FF
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x44FF00
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x00FF00
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x44FF00
  STORE r14, r1
  ADD r14, r14, r11
  LDI r1, 0x550077
  STORE r14, r1
  ADD r14, r14, r11
main_0:
  AND r6, r14, r15
  AND r14, r9, r2
  AND r6, r11, r13
  OR r1, r12, r15
  CMP r6, r15
  CMPI r6, 0x85FDEB
  FRAME
  JMP main_0
