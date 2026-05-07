; drawing loop program
; initialization
  LDI r5, 10
  LDI r3, 1931
  LDI r15, 3743
  LDI r27, 2
  LDI r0, 4013
  LDI r31, 750
  LDI r7, 2189
; palette
  LDI r14, 0x23DA
  LDI r6, 1
  LDI r12, 0xDD0044
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0xAAFF00
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x0000CC
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x000000
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x008888
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x444444
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x00FFAA
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0xFF8800
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x00FF44
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x444444
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x00AAFF
  STORE r14, r12
  ADD r14, r14, r6
  LDI r12, 0x0044FF
  STORE r14, r12
  ADD r14, r14, r6
main_0:
  XOR r9, r5, r1
  SAR r6, r21, r11
  SHR r16, r2, r14
  SHR r8, r3, r9
  SHL r4, r12, r1
  FRAME
  JMP main_0
