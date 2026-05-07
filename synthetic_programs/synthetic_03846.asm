; stack save/restore
; initialization
  LDI r6, 8
  LDI r1, 839
  LDI r0, 245
  PUSH r14
  PUSH r12
  PUSH r8
  XOR r10, r5, r15
  MUL r0, r11, r4
  SHR r8, r7, r9
  SHR r7, r15, r3
  POP r8
  POP r12
  POP r14
  MUL r4, r6, r5
  XOR r2, r25, r0
  DIV r3, r1, r4
  PUSH r9
  PUSH r5
  PUSH r4
  PUSH r6
  DIV r6, r14, r4
  MOD r7, r11, r2
  SUB r9, r5, r13
  POP r6
  POP r4
  POP r5
  POP r9
  HALT
