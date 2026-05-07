; stack save/restore
; initialization
  LDI r5, 100
  LDI r13, 1812
  PUSH r2
  PUSH r4
  PUSH r8
  PUSH r29
  MUL r2, r15, r9
  OR r6, r13, r4
  SUB r1, r2, r4
  XOR r7, r14, r3
  POP r29
  POP r8
  POP r4
  POP r2
  DIV r11, r15, r9
  AND r2, r10, r4
  SHR r1, r13, r3
  AND r3, r14, r8
  PUSH r12
  PUSH r7
  PUSH r4
  PUSH r3
  XOR r2, r9, r10
  SHL r12, r8, r3
  POP r3
  POP r4
  POP r7
  POP r12
  HALT
