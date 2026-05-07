; stack save/restore
; initialization
  LDI r7, 209
  LDI r10, 0xB59EDC
  LDI r5, 4006
  PUSH r6
  MOD r13, r12, r8
  AND r12, r10, r2
  SHR r10, r0, r15
  SUB r5, r14, r12
  POP r6
  SHL r12, r10, r6
  OR r10, r5, r1
  SHR r13, r25, r6
  XOR r14, r7, r8
  SUB r8, r5, r10
  PUSH r15
  PUSH r16
  PUSH r15
  OR r8, r13, r5
  DIV r3, r10, r14
  MUL r12, r5, r3
  MUL r2, r15, r13
  POP r15
  POP r16
  POP r15
  HALT
