; mixed program
; initialization
  LDI r7, 3865
  LDI r5, 1143
  LDI r14, 256
  LDI r12, 1836
  LDI r4, 658
  LDI r8, 16
  LDI r3, 0x74C685
; palette
  LDI r12, 0x24B7
  LDI r0, 1
  LDI r6, 0x0000CC
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x000066
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0xAAFF00
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x00FFAA
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x0000FF
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x880088
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0xFF0000
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0xFF8800
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x0000CC
  STORE r12, r6
  ADD r12, r12, r0
  LDI r6, 0x00FFFF
  STORE r12, r6
  ADD r12, r12, r0
  AND r5, r10, r15
  LDI r8, 0xE99CD0
  LDI r1, 64
  LDI r8, 255
  DRAWTEXT r8, r1, r8, "WORLD"
  AND r8, r4, r1
  AND r0, r9, r5
  AND r6, r4, r10
  XOR r1, r4, r9
  HALT
