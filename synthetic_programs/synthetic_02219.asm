; stack save/restore
; initialization
  LDI r6, 3232
  LDI r15, 0x211453
  PUSH r5
  PUSH r0
  PUSH r12
  PUSH r18
  SUB r6, r4, r9
  SHR r27, r7, r11
  AND r12, r4, r11
  MUL r2, r5, r1
  POP r18
  POP r12
  POP r0
  POP r5
  SHR r7, r14, r11
  AND r9, r13, r2
  DIV r14, r7, r4
  AND r3, r10, r1
  PUSH r13
  PUSH r5
  PUSH r10
  SUB r12, r1, r14
  MOD r11, r8, r6
  SHL r2, r7, r14
  POP r10
  POP r5
  POP r13
  HALT
