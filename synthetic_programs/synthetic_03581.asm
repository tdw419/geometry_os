; stack save/restore
; initialization
  LDI r8, 898
  LDI r1, 1
  PUSH r4
  PUSH r6
  PUSH r15
  PUSH r15
  SHR r13, r3, r7
  SUB r15, r13, r11
  SUB r0, r3, r6
  SHL r10, r9, r8
  XOR r11, r5, r2
  POP r15
  POP r15
  POP r6
  POP r4
  SHR r12, r1, r6
  AND r1, r5, r11
  DIV r10, r12, r31
  DIV r4, r5, r3
  SUB r0, r1, r11
  XOR r0, r21, r12
  PUSH r2
  MUL r8, r0, r11
  MOD r2, r0, r8
  AND r1, r9, r6
  POP r2
  HALT
