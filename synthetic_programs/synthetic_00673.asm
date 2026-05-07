; mixed program
; initialization
  LDI r6, 8
  LDI r9, 32
  LDI r2, 1
  LDI r14, 3217
  LDI r4, 0x622E9E
; palette
  LDI r27, 0x3099
  LDI r9, 1
  LDI r7, 0xFFAA00
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0x00FFFF
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0xFFFF00
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0x8800FF
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0x000000
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0x00AAFF
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0xFFAA00
  STORE r27, r7
  ADD r27, r27, r9
  LDI r7, 0x880088
  STORE r27, r7
  ADD r27, r27, r9
  CMPI r4, 64
  PUSH r0
  PUSH r29
  ADD r2, r7, r1
  SHR r7, r2, r15
  MOD r4, r8, r3
  SHR r7, r9, r13
  POP r29
  POP r0
  CMPI r9, 0xA5F504
  LDI r13, 0x0BC25F
  STORE r13, r1
  LOAD r12, r13
  LDI r11, 255
  STORE r11, r5
  LOAD r10, r11
  LDI r5, 429
  STORE r5, r12
  LOAD r6, r5
  LDI r1, 0xA227FA
  STORE r1, r15
  LOAD r4, r1
  LDI r9, 0x1C50B6
  STORE r9, r12
  LOAD r24, r9
  HALT
