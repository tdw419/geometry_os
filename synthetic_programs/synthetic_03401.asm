; stack save/restore
; initialization
  LDI r11, 64
  LDI r7, 571
  LDI r3, 0x0F0042
  LDI r5, 4
  PUSH r3
  PUSH r8
  SHR r13, r14, r7
  SHR r9, r11, r2
  DIV r0, r6, r11
  SUB r10, r12, r11
  MUL r2, r15, r5
  POP r8
  POP r3
  AND r6, r18, r3
  MOD r11, r13, r4
  AND r2, r7, r4
  DIV r6, r8, r2
  DIV r13, r5, r28
  OR r2, r10, r9
  PUSH r8
  PUSH r10
  PUSH r6
  PUSH r11
  SHR r15, r7, r14
  MOD r4, r15, r6
  DIV r6, r2, r15
  POP r11
  POP r6
  POP r10
  POP r8
  HALT
