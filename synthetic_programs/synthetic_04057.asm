; drawing loop program
; initialization
  LDI r3, 128
  LDI r2, 10
  LDI r14, 2934
  LDI r12, 64
  LDI r13, 2385
  LDI r8, 8
  LDI r4, 0x3102B4
; palette
  LDI r16, 0x40E7
  LDI r6, 1
  LDI r13, 0xFFFF00
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x00AAFF
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0xFF00FF
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0xFFFF00
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x000066
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0xAA00AA
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x0000FF
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x000066
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x00FF44
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x880088
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0xFF0000
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0xAA00AA
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x44FF00
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x0044FF
  STORE r16, r13
  ADD r16, r16, r6
  LDI r13, 0x444444
  STORE r16, r13
  ADD r16, r16, r6
main_0:
  SAR r7, r0, r6
  SHR r13, r7, r11
  SHR r11, r7, r12
  SHL r11, r2, r12
  OR r8, r19, r0
  OR r7, r1, r9
  OR r12, r11, r10
  AND r11, r0, r1
  LDI r12, 255
  LDI r8, 0x602397
  LDI r9, 0xF5ED1F
  TEXT r12, r8, r9, "HELLO"
  FRAME
  JMP main_0
