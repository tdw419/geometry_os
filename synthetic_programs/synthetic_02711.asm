; stack save/restore
; initialization
  LDI r7, 1874
  LDI r2, 256
  LDI r0, 0xCB6618
  LDI r11, 0xBEA3AB
  PUSH r9
  MUL r0, r6, r8
  SHR r6, r8, r10
  MOD r9, r8, r7
  MOD r11, r12, r4
  POP r9
  MUL r9, r2, r4
  XOR r0, r7, r2
  AND r11, r15, r6
  ADD r6, r4, r7
  MOD r15, r2, r11
  PUSH r2
  PUSH r13
  PUSH r5
  PUSH r2
  DIV r13, r3, r1
  SHL r4, r5, r2
  MOD r1, r8, r19
  SHL r13, r12, r15
  POP r2
  POP r5
  POP r13
  POP r2
  HALT
