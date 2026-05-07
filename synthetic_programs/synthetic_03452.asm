; stack save/restore
; initialization
  LDI r0, 2578
  LDI r6, 1584
  LDI r14, 256
  PUSH r14
  MOD r8, r3, r15
  MUL r4, r15, r5
  SHL r11, r7, r3
  POP r14
  MUL r0, r8, r13
  SHL r10, r2, r0
  XOR r2, r12, r13
  XOR r11, r14, r15
  MUL r0, r1, r9
  XOR r10, r1, r8
  MOD r8, r10, r16
  MUL r14, r11, r12
  PUSH r9
  PUSH r10
  PUSH r11
  AND r5, r15, r4
  OR r13, r9, r12
  DIV r11, r10, r3
  SUB r13, r4, r24
  POP r11
  POP r10
  POP r9
  HALT
