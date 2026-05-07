; stack save/restore
; initialization
  LDI r8, 0x718CB8
  LDI r1, 965
  LDI r7, 32
  LDI r4, 1683
  LDI r16, 128
  PUSH r3
  PUSH r9
  PUSH r6
  PUSH r12
  ADD r2, r0, r7
  SHR r3, r22, r4
  DIV r15, r7, r11
  SHR r4, r2, r23
  MOD r27, r9, r7
  POP r12
  POP r6
  POP r9
  POP r3
  DIV r12, r2, r7
  DIV r8, r7, r9
  DIV r13, r5, r14
  AND r15, r8, r4
  PUSH r8
  PUSH r3
  DIV r2, r8, r12
  MOD r6, r7, r9
  SHL r3, r11, r12
  ADD r14, r11, r13
  POP r3
  POP r8
  HALT
