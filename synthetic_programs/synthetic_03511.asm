; stack save/restore
; initialization
  LDI r13, 3150
  LDI r24, 1519
  LDI r14, 986
  LDI r12, 1309
  LDI r2, 4
  PUSH r11
  PUSH r7
  PUSH r1
  SHL r1, r31, r11
  SHL r21, r0, r11
  OR r10, r20, r0
  MOD r0, r15, r8
  XOR r13, r8, r7
  POP r1
  POP r7
  POP r11
  DIV r15, r8, r0
  MOD r1, r2, r10
  XOR r9, r4, r3
  SUB r1, r22, r6
  SHL r15, r11, r14
  DIV r11, r5, r10
  SHL r14, r13, r5
  SUB r7, r15, r11
  PUSH r11
  AND r26, r13, r11
  MOD r8, r9, r1
  POP r11
  HALT
