; drawing loop program
; initialization
  LDI r1, 64
  LDI r13, 0xDD1363
  LDI r0, 207
  LDI r8, 1279
; palette
  LDI r3, 0x2430
  LDI r27, 1
  LDI r12, 0x0044FF
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0x0000FF
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0x550077
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0xDD0044
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0x00FFAA
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0x00FF00
  STORE r3, r12
  ADD r3, r3, r27
  LDI r12, 0x00FF00
  STORE r3, r12
  ADD r3, r3, r27
main_0:
  CMP r12, r13
  ADDI r10, r14, 94
  ANDI r15, r1, 256
  FRAME
  JMP main_0
