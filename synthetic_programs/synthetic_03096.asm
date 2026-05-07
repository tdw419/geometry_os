; stack save/restore
; initialization
  LDI r4, 255
  LDI r1, 3086
  LDI r15, 0
  LDI r7, 4
  LDI r11, 0xDB08DA
  LDI r8, 1608
  PUSH r6
  PUSH r9
  MUL r2, r10, r14
  AND r10, r1, r13
  AND r4, r9, r1
  MUL r12, r10, r3
  POP r9
  POP r6
  SHR r28, r13, r5
  SUB r10, r15, r3
  AND r15, r2, r7
  MUL r9, r11, r5
  AND r11, r5, r12
  SUB r12, r15, r0
  SHL r6, r1, r7
  XOR r20, r10, r0
  PUSH r3
  PUSH r14
  PUSH r15
  MOD r1, r13, r12
  MOD r3, r2, r7
  MUL r4, r0, r11
  OR r12, r7, r4
  SHL r14, r3, r8
  POP r15
  POP r14
  POP r3
  HALT
