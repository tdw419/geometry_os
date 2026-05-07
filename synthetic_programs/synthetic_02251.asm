; stack save/restore
; initialization
  LDI r12, 194
  LDI r8, 4
  LDI r9, 0x33E833
  LDI r0, 4
  LDI r5, 3245
  PUSH r3
  PUSH r12
  PUSH r2
  PUSH r11
  SUB r2, r8, r15
  MUL r13, r0, r10
  MOD r9, r12, r15
  DIV r8, r9, r14
  ADD r14, r2, r11
  POP r11
  POP r2
  POP r12
  POP r3
  SUB r10, r9, r2
  MUL r2, r8, r1
  SHR r3, r14, r6
  MUL r3, r15, r4
  OR r0, r5, r9
  SHR r14, r13, r7
  DIV r2, r15, r20
  PUSH r11
  SHR r1, r0, r15
  XOR r6, r15, r4
  SHR r15, r8, r9
  SHL r10, r7, r5
  POP r11
  HALT
