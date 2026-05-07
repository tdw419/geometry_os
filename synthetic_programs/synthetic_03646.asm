; stack save/restore
; initialization
  LDI r3, 0
  LDI r4, 4
  LDI r9, 602
  LDI r6, 1183
  LDI r11, 4
  LDI r26, 1151
  LDI r5, 2309
  PUSH r11
  PUSH r6
  PUSH r13
  PUSH r17
  MOD r5, r2, r15
  SHL r11, r1, r8
  DIV r5, r12, r10
  POP r17
  POP r13
  POP r6
  POP r11
  SHL r11, r14, r12
  SUB r5, r8, r9
  SHL r5, r11, r2
  OR r30, r10, r13
  DIV r5, r4, r8
  DIV r6, r10, r11
  PUSH r3
  PUSH r14
  PUSH r14
  PUSH r2
  ADD r14, r12, r15
  MUL r11, r6, r5
  SUB r5, r13, r14
  SUB r5, r11, r9
  AND r4, r1, r12
  POP r2
  POP r14
  POP r14
  POP r3
  HALT
