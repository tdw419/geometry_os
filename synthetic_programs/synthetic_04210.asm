; drawing loop program
; initialization
  LDI r13, 0xDD0B68
  LDI r0, 0x96109F
  LDI r4, 3236
  LDI r6, 4
  LDI r15, 0x5B45C0
  LDI r2, 0x4AF590
  LDI r8, 1
  LDI r1, 2
; palette
  LDI r25, 0x40E8
  LDI r12, 1
  LDI r15, 0xFF0000
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x00FF44
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0xAAFF00
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x0000FF
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x00FF44
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0xFF4400
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x0044FF
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x00AAFF
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x0044FF
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x880088
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x000066
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x00FFFF
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x000066
  STORE r25, r15
  ADD r25, r25, r12
  LDI r15, 0x44FF00
  STORE r25, r15
  ADD r25, r25, r12
main_0:
  LDI r9, 2902
  LDI r6, 0x5E0883
  LDI r6, 16
  DRAWTEXT r9, r6, r6, "WORLD"
  ADD r14, r1, r9
  CMP r10, r1
  ADDI r3, r2, 222
  AND r11, r14, r3
  AND r2, r5, r8
  XOR r13, r8, r4
  OR r1, r0, r10
  AND r12, r11, r8
  FRAME
  JMP main_0
