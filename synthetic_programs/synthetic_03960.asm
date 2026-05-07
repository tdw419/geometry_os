; stack save/restore
; initialization
  LDI r2, 0x5394EA
  LDI r0, 4
  LDI r11, 3377
  LDI r10, 128
  PUSH r11
  PUSH r9
  XOR r12, r1, r15
  SHR r11, r12, r14
  MUL r2, r12, r5
  POP r9
  POP r11
  MOD r5, r10, r12
  AND r11, r6, r1
  SHR r2, r8, r7
  DIV r2, r1, r0
  PUSH r9
  PUSH r12
  PUSH r9
  DIV r24, r6, r10
  SHR r6, r2, r11
  AND r18, r15, r2
  MUL r1, r13, r23
  POP r9
  POP r12
  POP r9
  HALT
