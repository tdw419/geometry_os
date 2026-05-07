; drawing loop program
; initialization
  LDI r12, 3061
  LDI r6, 0xFF1B71
; palette
  LDI r4, 0x30CA
  LDI r5, 1
  LDI r27, 0x00FFAA
  STORE r4, r27
  ADD r4, r4, r5
  LDI r27, 0xFFAA00
  STORE r4, r27
  ADD r4, r4, r5
  LDI r27, 0x0000CC
  STORE r4, r27
  ADD r4, r4, r5
  LDI r27, 0x0000FF
  STORE r4, r27
  ADD r4, r4, r5
  LDI r27, 0x00AAFF
  STORE r4, r27
  ADD r4, r4, r5
main_0:
  CMP r10, r0
  LDI r15, 308
  FILL r15
  FRAME
  JMP main_0
