; drawing loop program
; initialization
  LDI r6, 2138
  LDI r4, 3707
  LDI r28, 0x577EA8
; palette
  LDI r3, 0x408D
  LDI r2, 1
  LDI r4, 0xFFAA00
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xAAFF00
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFF8800
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFF00FF
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0x00FFFF
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFFFFFF
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0x00FF44
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0x888800
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xDD0044
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFF8800
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xAAAAAA
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFFFF00
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0x008888
  STORE r3, r4
  ADD r3, r3, r2
  LDI r4, 0xFFAA00
  STORE r3, r4
  ADD r3, r3, r2
main_0:
  SUB r5, r7, r14
  IKEY r0
  CMPI r0, 0xEF1B40
  JNZ r0, key_1
  XOR r15, r0, r10
  OR r4, r5, r12
  OR r5, r1, r27
  IKEY r3
  CMPI r3, 124
  JNZ r3, key_2
  FRAME
  JMP main_0
