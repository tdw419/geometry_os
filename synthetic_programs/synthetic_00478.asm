; stack save/restore
; initialization
  LDI r6, 0xBD7CD8
  LDI r3, 0xDA7C7A
  PUSH r5
  PUSH r2
  PUSH r13
  PUSH r7
  AND r14, r4, r15
  MOD r12, r6, r14
  MUL r15, r5, r4
  AND r0, r1, r8
  POP r7
  POP r13
  POP r2
  POP r5
  MOD r15, r9, r14
  SHR r11, r14, r2
  SUB r11, r5, r12
  AND r13, r9, r7
  SUB r3, r11, r2
  DIV r5, r7, r20
  PUSH r13
  OR r28, r14, r17
  AND r1, r3, r15
  POP r13
  HALT
