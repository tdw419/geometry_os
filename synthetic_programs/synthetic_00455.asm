; mixed program
; initialization
  LDI r1, 2
  LDI r15, 255
  LDI r2, 0x61AA39
  LDI r0, 0x9E19D5
  LDI r13, 0x4BFDAE
  LDI r7, 2675
  LDI r14, 0
; palette
  LDI r4, 0x2314
  LDI r9, 1
  LDI r3, 0x880088
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x550077
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FF00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x000000
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00AAFF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x888800
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x008888
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFFEE00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xAA00AA
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x0044FF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFFFFFF
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0xFF8800
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FF00
  STORE r4, r3
  ADD r4, r4, r9
  LDI r3, 0x00FF44
  STORE r4, r3
  ADD r4, r4, r9
  SHL r12, r3, r19
  SHR r9, r5, r11
  SHL r4, r6, r5
  PUSH r4
  OR r9, r31, r1
  MUL r8, r2, r10
  DIV r2, r15, r9
  MUL r2, r7, r3
  POP r4
  PUSH r3
  PUSH r14
  PUSH r2
  SHR r3, r8, r6
  SUB r14, r18, r3
  ADD r9, r4, r13
  MOD r12, r16, r6
  MUL r6, r11, r4
  POP r2
  POP r14
  POP r3
  LDI r10, 256
  STORE r10, r4
  LOAD r9, r10
  LDI r0, 0x0B20FB
  STORE r0, r5
  LOAD r14, r0
  LDI r14, 64
  STORE r14, r5
  LOAD r1, r14
  HALT
