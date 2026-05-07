; stack save/restore
; initialization
  LDI r3, 486
  LDI r4, 256
  LDI r12, 3270
  LDI r0, 2541
  LDI r13, 447
  LDI r8, 0x18220D
  LDI r7, 2121
  LDI r6, 405
  PUSH r28
  PUSH r14
  PUSH r7
  SHL r9, r2, r3
  SHR r8, r1, r5
  POP r7
  POP r14
  POP r28
  MOD r4, r9, r3
  DIV r7, r13, r2
  XOR r8, r15, r13
  AND r9, r12, r14
  AND r8, r12, r5
  MUL r0, r24, r1
  PUSH r13
  PUSH r5
  PUSH r20
  AND r4, r9, r12
  SUB r16, r12, r6
  OR r0, r23, r10
  SHL r15, r1, r13
  MOD r13, r30, r24
  POP r20
  POP r5
  POP r13
  HALT
