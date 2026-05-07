; drawing loop program
; initialization
  LDI r8, 0x18D8AC
  LDI r1, 255
  LDI r13, 1530
  LDI r14, 32
  LDI r9, 2775
; palette
  LDI r13, 0x2035
  LDI r15, 1
  LDI r10, 0xFF8800
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x00FFFF
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x888800
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0xAAFF00
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x008888
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x888800
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x00FF44
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0xAA00AA
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x880088
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0xFF0000
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x444444
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x550077
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x000066
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0xAAFF00
  STORE r13, r10
  ADD r13, r13, r15
  LDI r10, 0x00FFAA
  STORE r13, r10
  ADD r13, r13, r15
main_0:
  CMP r15, r12
  SUBI r6, r4, 8
  LDI r12, 469
  LDI r3, 0
  LDI r7, 1114
  PSET r12, r3, r7
  SHR r6, r9, r4
  SHLI r4, r6, 2
  SHL r10, r9, r13
  SHLI r10, r11, 0x0144C7
  SHR r13, r9, r5
  SHL r13, r1, r9
  XOR r5, r9, r4
  AND r14, r15, r12
  XOR r8, r2, r0
  AND r4, r9, r7
  FRAME
  JMP main_0
