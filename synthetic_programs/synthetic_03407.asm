; drawing loop program
; initialization
  LDI r5, 1090
  LDI r11, 256
  LDI r9, 0xDA6DE1
  LDI r10, 2790
  LDI r1, 256
  LDI r13, 10
; palette
  LDI r11, 0x40C8
  LDI r6, 1
  LDI r12, 0x00FF44
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0xDD0044
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x44FF00
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x44FF00
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x00AAFF
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x008888
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x00FF44
  STORE r11, r12
  ADD r11, r11, r6
  LDI r12, 0x8800FF
  STORE r11, r12
  ADD r11, r11, r6
main_0:
  AND r12, r13, r27
  AND r6, r1, r5
  XOR r14, r1, r3
  AND r5, r0, r3
  XOR r10, r6, r2
  SHLI r12, r4, 1
  SAR r15, r31, r8
  CMPI r10, r6, 64
  FRAME
  JMP main_0
