; drawing loop program
; initialization
  LDI r4, 22
  LDI r2, 1
  LDI r13, 3280
; palette
  LDI r6, 0x5010
  LDI r12, 1
  LDI r14, 0x00FF00
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x000066
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xFF0000
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x008888
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xAAAAAA
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xFF8800
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x000066
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xFFAA00
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xFFAA00
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x888800
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x444444
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x008888
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0xFF00FF
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x00FFAA
  STORE r6, r14
  ADD r6, r6, r12
  LDI r14, 0x00AAFF
  STORE r6, r14
  ADD r6, r6, r12
main_0:
  MOD r2, r0, r3
  SAR r2, r4, r10
  SAR r13, r25, r14
  SAR r12, r14, r6
  FRAME
  JMP main_0
