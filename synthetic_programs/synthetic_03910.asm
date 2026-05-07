; stack save/restore
; initialization
  LDI r10, 1637
  LDI r14, 843
  LDI r3, 0xD49AAD
  LDI r4, 10
  PUSH r14
  PUSH r2
  PUSH r10
  PUSH r14
  MOD r4, r12, r15
  SHL r10, r6, r2
  MOD r5, r3, r10
  SHL r7, r6, r11
  MUL r1, r13, r11
  POP r14
  POP r10
  POP r2
  POP r14
  XOR r5, r6, r4
  DIV r15, r2, r3
  ADD r27, r9, r2
  SHR r12, r3, r9
  AND r2, r12, r10
  PUSH r5
  PUSH r13
  AND r5, r7, r11
  SUB r8, r6, r12
  OR r6, r15, r4
  AND r12, r0, r3
  MUL r3, r0, r8
  POP r13
  POP r5
  HALT
