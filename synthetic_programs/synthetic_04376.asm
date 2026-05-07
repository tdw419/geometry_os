; stack save/restore
; initialization
  LDI r3, 2276
  LDI r5, 8
  LDI r13, 0xB7F657
  LDI r11, 1694
  LDI r7, 3282
  LDI r4, 32
  PUSH r13
  PUSH r5
  SHL r9, r12, r6
  MOD r15, r14, r19
  DIV r5, r3, r8
  MOD r12, r11, r2
  POP r5
  POP r13
  MOD r8, r9, r12
  AND r15, r1, r6
  AND r2, r28, r10
  PUSH r15
  PUSH r9
  PUSH r12
  PUSH r6
  MUL r3, r8, r12
  MOD r2, r11, r1
  DIV r0, r2, r7
  MUL r3, r9, r11
  MUL r9, r12, r8
  POP r6
  POP r12
  POP r9
  POP r15
  HALT
