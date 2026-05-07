; stack save/restore
; initialization
  LDI r11, 1
  LDI r8, 0
  LDI r2, 8
  PUSH r15
  PUSH r9
  PUSH r3
  AND r5, r4, r11
  XOR r14, r2, r13
  POP r3
  POP r9
  POP r15
  DIV r15, r8, r12
  SHR r9, r10, r13
  OR r4, r2, r8
  SUB r2, r3, r11
  AND r10, r5, r7
  SHL r0, r1, r10
  MOD r1, r2, r8
  SUB r10, r13, r5
  PUSH r9
  PUSH r4
  PUSH r10
  DIV r8, r5, r13
  OR r7, r13, r8
  MUL r7, r2, r9
  AND r9, r5, r3
  POP r10
  POP r4
  POP r9
  HALT
