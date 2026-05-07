; stack save/restore
; initialization
  LDI r10, 0xEA3EB4
  LDI r14, 1343
  LDI r12, 0xAF41B8
  LDI r15, 4
  LDI r0, 4067
  LDI r4, 393
  LDI r8, 638
  PUSH r10
  PUSH r15
  PUSH r11
  MOD r8, r10, r14
  DIV r9, r4, r14
  POP r11
  POP r15
  POP r10
  DIV r3, r9, r6
  DIV r17, r11, r15
  DIV r14, r8, r13
  MOD r10, r1, r9
  ADD r3, r15, r2
  XOR r15, r2, r6
  SUB r6, r9, r4
  MOD r15, r3, r9
  PUSH r2
  PUSH r16
  PUSH r2
  DIV r11, r9, r0
  MOD r4, r2, r12
  MUL r8, r13, r15
  OR r15, r0, r12
  POP r2
  POP r16
  POP r2
  HALT
