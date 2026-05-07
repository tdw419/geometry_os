; stack save/restore
; initialization
  LDI r4, 3167
  LDI r11, 269
  LDI r14, 4
  LDI r9, 3428
  PUSH r14
  SHL r11, r14, r13
  AND r4, r8, r13
  POP r14
  DIV r12, r14, r6
  SUB r5, r14, r3
  XOR r6, r31, r4
  MUL r15, r0, r4
  MOD r4, r25, r11
  PUSH r5
  PUSH r13
  AND r1, r13, r12
  SUB r24, r2, r4
  XOR r4, r11, r7
  MOD r6, r2, r7
  SHR r4, r7, r10
  POP r13
  POP r5
  HALT
