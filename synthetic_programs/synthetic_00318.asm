; drawing loop program
; initialization
  LDI r6, 128
  LDI r12, 0x42D46F
  LDI r10, 0xB3EBAB
  LDI r1, 0xF57273
  LDI r5, 586
  LDI r3, 3589
  LDI r9, 0x0FD89E
; palette
  LDI r2, 0x60C0
  LDI r13, 1
  LDI r0, 0x008888
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x000066
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x00FF00
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x000000
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x00AAFF
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x444444
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0xDD0044
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x000066
  STORE r2, r0
  ADD r2, r2, r13
  LDI r0, 0x00FF00
  STORE r2, r0
  ADD r2, r2, r13
main_0:
  LDI r0, 1695
  LDI r6, 128
  LDI r5, 2383
  TEXT r0, r6, r5, "HELLO"
  LDI r12, 10
  FILL r12
  LDI r12, 0x4C0322
  LDI r0, 26
  LDI r12, 0xACBD96
  DRAWTEXT r12, r0, r12, "WORLD"
  LDI r9, 0xCF3854
  LDI r0, 953
  LDI r2, 1
  TEXT r9, r0, r2, "HELLO"
  ADDI r5, r11, 128
  OR r6, r12, r14
  FRAME
  JMP main_0
