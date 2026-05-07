; stack save/restore
; initialization
  LDI r6, 8
  LDI r10, 16
  PUSH r7
  PUSH r10
  PUSH r5
  MUL r15, r6, r3
  MOD r0, r9, r5
  OR r11, r9, r0
  SHR r3, r4, r15
  SUB r9, r15, r3
  POP r5
  POP r10
  POP r7
  SHR r1, r12, r14
  OR r0, r3, r14
  AND r1, r15, r10
  DIV r8, r30, r1
  PUSH r14
  PUSH r15
  DIV r0, r8, r6
  MUL r13, r9, r3
  ADD r4, r1, r12
  POP r15
  POP r14
  HALT
