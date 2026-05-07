; stack save/restore
; initialization
  LDI r6, 256
  LDI r1, 32
  LDI r15, 3526
  LDI r11, 0x8B96D4
  PUSH r20
  PUSH r31
  XOR r4, r14, r6
  XOR r6, r9, r4
  MOD r0, r31, r7
  SUB r5, r15, r8
  DIV r2, r5, r8
  POP r31
  POP r20
  SHR r11, r8, r10
  OR r4, r0, r11
  AND r2, r9, r4
  MOD r1, r5, r13
  DIV r31, r13, r29
  SHR r7, r8, r12
  PUSH r9
  PUSH r2
  PUSH r10
  PUSH r10
  SUB r3, r8, r5
  DIV r13, r12, r10
  MUL r7, r14, r8
  POP r10
  POP r10
  POP r2
  POP r9
  HALT
