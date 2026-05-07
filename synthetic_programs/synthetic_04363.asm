; stack save/restore
; initialization
  LDI r5, 0xB756E1
  LDI r6, 64
  LDI r13, 0x877805
  LDI r24, 2981
  LDI r9, 2224
  LDI r12, 817
  LDI r11, 0xBAAA3E
  LDI r4, 0xEA75C0
  PUSH r12
  PUSH r0
  PUSH r6
  PUSH r8
  MOD r7, r8, r2
  DIV r2, r15, r0
  SUB r8, r1, r6
  XOR r12, r4, r11
  ADD r4, r7, r11
  POP r8
  POP r6
  POP r0
  POP r12
  AND r15, r9, r8
  DIV r10, r5, r6
  XOR r5, r7, r19
  XOR r6, r3, r4
  PUSH r8
  PUSH r2
  PUSH r3
  PUSH r5
  MOD r13, r0, r4
  MOD r8, r9, r2
  MOD r15, r11, r3
  MOD r1, r11, r9
  POP r5
  POP r3
  POP r2
  POP r8
  HALT
