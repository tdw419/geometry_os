; stack save/restore
; initialization
  LDI r2, 2318
  LDI r13, 4
  LDI r12, 3342
  LDI r4, 0xEE1E1C
  LDI r14, 2918
  LDI r9, 2
  LDI r1, 128
  LDI r15, 3995
  PUSH r9
  PUSH r0
  PUSH r14
  PUSH r4
  ADD r5, r7, r12
  SHL r5, r10, r12
  DIV r1, r14, r10
  POP r4
  POP r14
  POP r0
  POP r9
  SHL r15, r6, r8
  XOR r12, r8, r10
  DIV r15, r0, r21
  SUB r11, r8, r1
  AND r12, r8, r1
  SUB r13, r17, r0
  MUL r2, r5, r15
  PUSH r10
  PUSH r6
  PUSH r0
  SHL r13, r10, r3
  SHL r9, r10, r4
  SUB r1, r7, r9
  SHL r13, r4, r9
  MOD r10, r0, r11
  POP r0
  POP r6
  POP r10
  HALT
