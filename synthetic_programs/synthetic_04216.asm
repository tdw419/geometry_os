; stack save/restore
; initialization
  LDI r9, 0x1106B4
  LDI r12, 32
  LDI r5, 2587
  LDI r4, 64
  LDI r11, 64
  PUSH r10
  PUSH r23
  MUL r14, r28, r13
  DIV r2, r8, r1
  MUL r13, r0, r2
  SUB r1, r18, r0
  MOD r1, r15, r2
  POP r23
  POP r10
  SHR r4, r21, r14
  MOD r5, r20, r11
  AND r1, r10, r8
  XOR r13, r12, r1
  SHL r3, r4, r10
  PUSH r14
  PUSH r5
  PUSH r4
  OR r11, r1, r3
  OR r7, r0, r10
  MUL r1, r4, r2
  SUB r6, r4, r8
  MOD r3, r6, r2
  POP r4
  POP r5
  POP r14
  HALT
