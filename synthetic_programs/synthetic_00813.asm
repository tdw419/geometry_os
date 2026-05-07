; stack save/restore
; initialization
  LDI r7, 1189
  LDI r0, 0x9F89F3
  PUSH r7
  PUSH r1
  PUSH r14
  DIV r5, r7, r12
  DIV r15, r4, r12
  POP r14
  POP r1
  POP r7
  MOD r11, r2, r8
  AND r13, r30, r0
  DIV r9, r10, r5
  PUSH r6
  PUSH r14
  OR r0, r8, r14
  OR r7, r11, r4
  OR r5, r8, r15
  POP r14
  POP r6
  HALT
