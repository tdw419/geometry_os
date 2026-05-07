; stack save/restore
; initialization
  LDI r11, 0x2FF537
  LDI r8, 3651
  PUSH r1
  PUSH r11
  MUL r6, r0, r15
  SHL r9, r12, r6
  DIV r9, r13, r1
  DIV r6, r4, r13
  POP r11
  POP r1
  SHR r8, r1, r7
  MOD r3, r31, r6
  DIV r7, r1, r30
  PUSH r4
  OR r12, r13, r5
  DIV r12, r3, r0
  POP r4
  HALT
