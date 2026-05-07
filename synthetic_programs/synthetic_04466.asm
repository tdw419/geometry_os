; drawing loop program
; initialization
  LDI r10, 1317
  LDI r12, 1
  LDI r4, 10
  LDI r11, 1096
  LDI r1, 32
; palette
  LDI r4, 0x2160
  LDI r14, 1
  LDI r6, 0xFF0000
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0xDD0044
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0xFFFF00
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0x00AAFF
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0xAA00AA
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0x00FF44
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0x00AAFF
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0x0000FF
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0xDD0044
  STORE r4, r6
  ADD r4, r4, r14
  LDI r6, 0x8800FF
  STORE r4, r6
  ADD r4, r4, r14
main_0:
  SHLI r15, r0, 7
  SHL r3, r8, r11
  SAR r1, r11, r5
  SHR r8, r12, r21
  XOR r7, r9, r3
  AND r4, r12, r11
  AND r1, r0, r12
  OR r6, r15, r1
  AND r2, r11, r5
  OR r9, r5, r15
  OR r13, r15, r11
  FRAME
  JMP main_0
