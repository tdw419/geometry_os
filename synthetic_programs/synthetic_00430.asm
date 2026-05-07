; stack save/restore
; initialization
  LDI r15, 3927
  LDI r5, 3526
  LDI r2, 569
  LDI r4, 1867
  PUSH r13
  PUSH r12
  PUSH r12
  PUSH r15
  AND r4, r2, r5
  SHR r0, r5, r2
  MOD r3, r7, r8
  POP r15
  POP r12
  POP r12
  POP r13
  SHL r7, r18, r5
  DIV r7, r14, r15
  MUL r14, r1, r7
  PUSH r0
  PUSH r0
  PUSH r15
  PUSH r14
  MOD r14, r1, r11
  MUL r2, r10, r14
  MOD r10, r3, r11
  MOD r5, r6, r1
  MUL r11, r2, r4
  POP r14
  POP r15
  POP r0
  POP r0
  HALT
