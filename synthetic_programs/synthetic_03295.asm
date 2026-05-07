; stack save/restore
; initialization
  LDI r14, 2
  LDI r6, 4000
  LDI r0, 0
  LDI r2, 255
  LDI r3, 794
  LDI r8, 0
  LDI r12, 0xDA38D1
  PUSH r10
  PUSH r6
  PUSH r15
  PUSH r6
  ADD r9, r7, r6
  MOD r8, r13, r0
  AND r14, r10, r0
  ADD r13, r5, r15
  OR r15, r12, r13
  POP r6
  POP r15
  POP r6
  POP r10
  AND r9, r2, r22
  DIV r0, r2, r9
  DIV r8, r9, r13
  DIV r9, r4, r0
  MUL r9, r11, r15
  MUL r8, r7, r11
  AND r9, r6, r3
  DIV r0, r14, r5
  PUSH r15
  PUSH r3
  OR r14, r6, r9
  MOD r2, r0, r14
  SHR r3, r13, r1
  ADD r14, r5, r15
  SUB r0, r6, r10
  POP r3
  POP r15
  HALT
