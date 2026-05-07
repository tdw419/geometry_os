; stack save/restore
; initialization
  LDI r12, 945
  LDI r0, 1962
  LDI r5, 0x416C83
  LDI r3, 256
  LDI r15, 0x8A9524
  LDI r4, 2
  LDI r8, 3821
  LDI r13, 0
  PUSH r10
  MOD r8, r12, r6
  ADD r1, r8, r4
  SHL r5, r13, r10
  POP r10
  MUL r0, r10, r11
  ADD r11, r12, r8
  MUL r15, r14, r7
  MOD r0, r5, r12
  MUL r2, r22, r6
  PUSH r13
  PUSH r11
  PUSH r6
  AND r11, r0, r13
  DIV r1, r13, r4
  POP r6
  POP r11
  POP r13
  HALT
