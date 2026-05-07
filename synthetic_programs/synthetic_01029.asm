; drawing loop program
; initialization
  LDI r1, 0
  LDI r15, 0
  LDI r5, 4
  LDI r4, 254
  LDI r2, 0xF7C358
  LDI r7, 1301
; palette
  LDI r1, 0x50C2
  LDI r8, 1
  LDI r10, 0xFFEE00
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0x0000FF
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0xFF00FF
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0x000000
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0x44FF00
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0x8800FF
  STORE r1, r10
  ADD r1, r1, r8
  LDI r10, 0xDD0044
  STORE r1, r10
  ADD r1, r1, r8
main_0:
  OR r12, r3, r9
  SHL r9, r12, r13
  SHR r10, r5, r12
  SAR r10, r11, r12
  SHL r1, r14, r12
  MUL r14, r6, r2
  FRAME
  JMP main_0
