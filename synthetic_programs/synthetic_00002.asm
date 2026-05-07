; drawing loop program
; initialization
  LDI r13, 443
  LDI r3, 0xADB912
  LDI r6, 2
  LDI r7, 64
  LDI r0, 1936
  LDI r15, 480
  LDI r24, 2336
; palette
  LDI r31, 0x701F
  LDI r9, 1
  LDI r1, 0x008888
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFFFFFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFFFFFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x00FF44
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x0044FF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x00AAFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x0044FF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x000066
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x00AAFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFFFF00
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFFFFFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x00AAFF
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFF0000
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0x000066
  STORE r31, r1
  ADD r31, r31, r9
  LDI r1, 0xFFFF00
  STORE r31, r1
  ADD r31, r31, r9
main_0:
  DIV r7, r1, r13
  AND r10, r12, r9
  OR r2, r3, r6
  XOR r11, r7, r5
  FRAME
  JMP main_0
