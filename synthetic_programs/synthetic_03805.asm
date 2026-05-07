; stack save/restore
; initialization
  LDI r9, 0x4C6DD2
  LDI r15, 0xAD5751
  LDI r14, 2295
  PUSH r8
  PUSH r4
  DIV r2, r3, r11
  MUL r6, r12, r4
  SHR r8, r15, r1
  DIV r5, r26, r29
  POP r4
  POP r8
  OR r9, r4, r8
  AND r13, r2, r6
  SUB r5, r12, r0
  MOD r12, r0, r3
  DIV r30, r4, r11
  PUSH r1
  PUSH r15
  DIV r6, r5, r13
  XOR r8, r13, r2
  XOR r9, r14, r11
  SHL r4, r12, r1
  XOR r10, r3, r15
  POP r15
  POP r1
  HALT
