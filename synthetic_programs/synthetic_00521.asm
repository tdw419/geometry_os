; stack save/restore
; initialization
  LDI r5, 1
  LDI r7, 1273
  LDI r15, 80
  PUSH r6
  PUSH r11
  DIV r8, r13, r6
  OR r1, r2, r3
  SHL r13, r1, r9
  POP r11
  POP r6
  SHL r3, r0, r8
  MUL r8, r6, r10
  AND r13, r11, r8
  XOR r8, r14, r31
  XOR r4, r14, r2
  MOD r0, r9, r8
  PUSH r3
  DIV r10, r11, r3
  SHR r5, r2, r1
  OR r10, r2, r3
  SHL r9, r7, r3
  AND r24, r13, r1
  POP r3
  HALT
