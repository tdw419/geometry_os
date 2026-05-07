; drawing loop program
; initialization
  LDI r10, 0xEE632F
  LDI r15, 685
  LDI r14, 32
  LDI r4, 3796
  LDI r3, 3629
; palette
  LDI r7, 0x22EE
  LDI r14, 1
  LDI r16, 0x0000FF
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0xFF00FF
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x8800FF
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x00FF00
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x00FFFF
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x00FFAA
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0xDD0044
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x444444
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0xDD0044
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x444444
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0xAAAAAA
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x44FF00
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0x0000FF
  STORE r7, r16
  ADD r7, r7, r14
  LDI r16, 0xFFFF00
  STORE r7, r16
  ADD r7, r7, r14
main_0:
  AND r4, r8, r10
  OR r6, r10, r0
  AND r7, r15, r1
  CMP r11, r4
  CMPI r10, r1, 8
  FRAME
  JMP main_0
