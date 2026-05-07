; mixed program
; initialization
  LDI r14, 2323
  LDI r0, 1391
  LDI r8, 0
  LDI r13, 8
  LDI r7, 256
  LDI r1, 0xA229B8
; palette
  LDI r28, 0x706E
  LDI r0, 1
  LDI r3, 0xAAAAAA
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x00FFAA
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0xAA00AA
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0xFF8800
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x888800
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x000000
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x444444
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x000000
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0xFFFFFF
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x0000FF
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x0000CC
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0xFF0000
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0xFFFF00
  STORE r28, r3
  ADD r28, r28, r0
  LDI r3, 0x00FFAA
  STORE r28, r3
  ADD r28, r28, r0
  LDI r10, 0x4F8BE7
  STORE r10, r1
  LOAD r13, r10
  LDI r3, 32
  STORE r3, r15
  LOAD r14, r3
  LDI r5, 64
  STORE r5, r6
  LOAD r15, r5
  LDI r10, 10
  LDI r3, 1319
  LDI r15, 2288
  PSET r10, r3, r15
  PUSH r9
  MOD r2, r8, r0
  MUL r11, r8, r0
  XOR r12, r9, r15
  OR r4, r14, r12
  SHR r1, r10, r13
  POP r9
  HALT
