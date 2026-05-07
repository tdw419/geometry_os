; mixed program
; initialization
  LDI r7, 3789
  LDI r13, 1
  LDI r3, 1653
  LDI r11, 2423
  LDI r10, 2119
  LDI r15, 0x9AEAE6
; palette
  LDI r1, 0x80B7
  LDI r7, 1
  LDI r15, 0x00FF44
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x00AAFF
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0xFFEE00
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0xFFEE00
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x0000FF
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0xAAAAAA
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x8800FF
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x0000CC
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x444444
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x8800FF
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x000066
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0xAAAAAA
  STORE r1, r15
  ADD r1, r1, r7
  LDI r15, 0x008888
  STORE r1, r15
  ADD r1, r1, r7
  LDI r0, 128
  STORE r0, r12
  LOAD r9, r0
  LDI r3, 64
  STORE r3, r3
  LOAD r1, r3
  LDI r1, 10x30A860x30A8
  STORE r1, r0
  LOAD r8, r1
  LDI r15, 1196
  STORE r15, r4
  LOAD r11, r15
  LDI r9, 3348
  LDI r15, 0xCDEFF9
  LDI r14, 2610
  PSETI
  SHLI r11, r3, 1
  SHL r14, r12, r15
  PUSH r4
  PUSH r15
  AND r10, r7, r0
  SHR r12, r0, r9
  XOR r9, r10, r31
  MUL r1, r14, r6
  MOD r6, r5, r15
  POP r15
  POP r4
  PUSH r6
  PUSH r15
  PUSH r11
  OR r9, r10, r14
  MOD r3, r8, r19
  XOR r13, r6, r9
  POP r11
  POP r15
  POP r6
  SHL r5, r9, r12
  SHLI r6, r11, 0x9C794C
  SHL r15, r7, r8
  SHLI r15, r9, 8
  MOD r10, r0, r2
  CMP r19, r14
  HALT
