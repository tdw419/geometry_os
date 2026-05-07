; drawing loop program
; initialization
  LDI r25, 0x0E531A
  LDI r4, 8
  LDI r6, 0xFA4329
  LDI r11, 0x16E09F
; palette
  LDI r14, 0x22EB
  LDI r12, 1
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xFFEE00
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xAAAAAA
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x0000FF
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x000066
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xFF4400
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x008888
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xFF0000
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xAA00AA
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x44FF00
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0xFFEE00
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x44FF00
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x444444
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x880088
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x00FFFF
  STORE r14, r4
  ADD r14, r14, r12
  LDI r4, 0x0000CC
  STORE r14, r4
  ADD r14, r14, r12
main_0:
  AND r30, r2, r0
  XOR r9, r3, r2
  AND r17, r22, r0
  AND r5, r24, r7
  LDI r10, 0
  LDI r5, 2599
  LDI r2, 0x32DBDB
  DRAWTEXT r10, r5, r2, "WORLD"
  SHR r2, r13, r1
  SAR r1, r3, r13
  OR r3, r7, r12
  AND r10, r13, r0
  OR r0, r3, r4
  SHLI r6, r4, 3
  SHLI r30, r14, 2
  SHL r15, r8, r12
  SAR r6, r9, r2
  FRAME
  JMP main_0
