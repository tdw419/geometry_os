; mixed program
; initialization
  LDI r7, 8
  LDI r12, 0x0CF04A
  LDI r14, 0xC8488A
; palette
  LDI r0, 0x2447
  LDI r12, 1
  LDI r4, 0x000000
  STORE r0, r4
  ADD r0, r0, r12
  LDI r4, 0x880088
  STORE r0, r4
  ADD r0, r0, r12
  LDI r4, 0x000066
  STORE r0, r4
  ADD r0, r0, r12
  LDI r4, 0xFF8800
  STORE r0, r4
  ADD r0, r0, r12
  LDI r4, 0x00FF00
  STORE r0, r4
  ADD r0, r0, r12
  LDI r4, 0x8800FF
  STORE r0, r4
  ADD r0, r0, r12
  LDI r10, 2341
  STORE r10, r3
  LOAD r5, r10
  LDI r11, 0xA2153C
  STORE r11, r6
  LOAD r2, r11
  LDI r0, 0x30FC97
  STORE r0, r14
  LOAD r10, r0
  XOR r0, r21, r2
  XOR r14, r5, r13
  XOR r20, r12, r8
  PUSH r3
  PUSH r15
  PUSH r7
  MOD r0, r5, r2
  ADD r15, r3, r10
  DIV r28, r11, r9
  OR r6, r2, r15
  POP r7
  POP r15
  POP r3
  MOD r11, r10, r12
  CMP r2, r6
  JZ r2, else_0
  AND r15, r4, r8
  JMP endif_1
else_0:
  LDI r6, 0
  LDI r5, 1951
  LDI r10, 32
  PSET r6, r5, r10
  LDI r14, 3682
  LDI r6, 2
  LDI r30, 64
  PSET r14, r6, r30
  LDI r7, 1
  LDI r8, 0x2F414E
  LDI r15, 2083
  PSET r7, r8, r15
endif_1:
  LDI r0, 255
  LDI r10, 2158
  LDI r0, 2686
  TEXT r0, r10, r0, "HELLO"
  CMP r14, r10
  SHR r14, r10, r2
  HALT
