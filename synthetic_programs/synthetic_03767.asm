; drawing loop program
; initialization
  LDI r1, 3892
  LDI r8, 255
  LDI r5, 255
; palette
  LDI r12, 0x22C0
  LDI r8, 1
  LDI r14, 0x00AAFF
  STORE r12, r14
  ADD r12, r12, r8
  LDI r14, 0xFF4400
  STORE r12, r14
  ADD r12, r12, r8
  LDI r14, 0x44FF00
  STORE r12, r14
  ADD r12, r12, r8
  LDI r14, 0x000000
  STORE r12, r14
  ADD r12, r12, r8
  LDI r14, 0x000000
  STORE r12, r14
  ADD r12, r12, r8
main_0:
  MOD r4, r15, r3
  LDI r1, 4
  LDI r15, 723
  LDI r5, 256
  LDI r12, 0xB79AEB
  LDI r2, 1236
  RECTF r1, r15, r5, r12, r2
  ADD r6, r14, r4
  FRAME
  JMP main_0
