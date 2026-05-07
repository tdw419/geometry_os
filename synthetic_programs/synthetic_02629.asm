; stack save/restore
; initialization
  LDI r15, 0
  LDI r26, 1346
  PUSH r6
  PUSH r6
  XOR r6, r1, r10
  XOR r3, r11, r15
  AND r12, r8, r2
  OR r6, r8, r4
  OR r14, r11, r9
  POP r6
  POP r6
  SHL r0, r1, r14
  AND r2, r14, r4
  SHR r5, r1, r15
  DIV r14, r3, r5
  OR r11, r4, r5
  PUSH r14
  PUSH r8
  PUSH r14
  PUSH r1
  DIV r7, r5, r15
  SUB r13, r0, r8
  MOD r4, r15, r9
  DIV r12, r2, r15
  AND r5, r11, r14
  POP r1
  POP r14
  POP r8
  POP r14
  HALT
