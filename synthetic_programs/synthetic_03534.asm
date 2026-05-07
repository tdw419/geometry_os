; mixed program
; initialization
  LDI r31, 2807
  LDI r11, 2126
  LDI r13, 0x80A8B0
  LDI r15, 1579
  LDI r2, 0x0E6C7A
  LDI r16, 128
  LDI r5, 2299
; palette
  LDI r2, 0x2059
  LDI r7, 1
  LDI r6, 0x00FF00
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0x444444
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0xAA00AA
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0x008888
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0x00FF44
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0x00FFAA
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0x00AAFF
  STORE r2, r6
  ADD r2, r2, r7
  LDI r6, 0xAA00AA
  STORE r2, r6
  ADD r2, r2, r7
  LDI r1, 210
  STORE r1, r11
  LOAD r5, r1
  LDI r7, 0xD5CF80
  STORE r7, r2
  LOAD r3, r7
  PUSH r2
  PUSH r6
  PUSH r31
  PUSH r2
  DIV r15, r13, r0
  DIV r6, r12, r10
  MOD r5, r15, r12
  AND r2, r1, r5
  SUB r12, r2, r4
  POP r2
  POP r31
  POP r6
  POP r2
  LDI r3, 1
loop_0:
  SUBI r8, r11, 16
  LDI r8, 0x1E07DF
  LDI r14, 8
  LDI r0, 0x5CEE33
  PSET r8, r14, r0
  LDI r8, 1
  SUB r3, r3, r8
  JNZ r3, loop_0
  LDI r8, 0xD7C6D3
  STORE r8, r9
  LOAD r7, r8
  LDI r2, 0x82D248
  STORE r2, r12
  LOAD r11, r2
  HALT
