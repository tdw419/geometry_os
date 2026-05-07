; stack save/restore
; initialization
  LDI r31, 189
  LDI r8, 912
  PUSH r11
  PUSH r12
  OR r2, r8, r7
  MOD r2, r8, r7
  MUL r2, r4, r3
  AND r13, r7, r0
  SHL r10, r15, r12
  POP r12
  POP r11
  SHR r0, r5, r11
  SUB r12, r11, r30
  SHR r15, r0, r6
  XOR r2, r15, r10
  SUB r10, r12, r13
  PUSH r12
  PUSH r0
  PUSH r27
  SUB r3, r7, r19
  AND r8, r14, r10
  DIV r11, r10, r8
  POP r27
  POP r0
  POP r12
  HALT
