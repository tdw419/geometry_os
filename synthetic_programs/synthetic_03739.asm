; stack save/restore
; initialization
  LDI r14, 0xAE793E
  LDI r6, 16
  LDI r1, 0x000DC8
  PUSH r15
  PUSH r4
  DIV r1, r15, r9
  SHR r15, r11, r12
  DIV r4, r0, r12
  POP r4
  POP r15
  OR r12, r3, r2
  AND r10, r9, r6
  AND r11, r8, r9
  PUSH r5
  PUSH r5
  PUSH r6
  OR r2, r13, r15
  MOD r8, r0, r4
  MOD r15, r13, r6
  POP r6
  POP r5
  POP r5
  HALT
