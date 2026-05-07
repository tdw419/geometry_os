; stack save/restore
; initialization
  LDI r6, 2625
  LDI r4, 64
  LDI r3, 128
  LDI r12, 128
  LDI r0, 16
  LDI r25, 1
  LDI r10, 4
  LDI r8, 16
  PUSH r14
  PUSH r0
  PUSH r13
  SUB r15, r0, r6
  SHL r4, r1, r14
  SUB r15, r1, r19
  OR r4, r1, r5
  POP r13
  POP r0
  POP r14
  SUB r2, r7, r15
  SHL r3, r7, r13
  OR r27, r14, r6
  MUL r5, r8, r14
  SUB r1, r14, r4
  PUSH r11
  PUSH r0
  PUSH r15
  SHL r13, r6, r4
  XOR r1, r7, r5
  AND r11, r5, r7
  DIV r18, r12, r1
  SHL r14, r8, r4
  POP r15
  POP r0
  POP r11
  HALT
