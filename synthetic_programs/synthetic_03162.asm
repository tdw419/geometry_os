; stack save/restore
; initialization
  LDI r10, 0
  LDI r15, 0x7EE32F
  LDI r7, 0x35A713
  LDI r8, 3625
  LDI r3, 0x3CEE30
  LDI r4, 3190
  LDI r12, 0x466C3A
  PUSH r9
  PUSH r6
  PUSH r3
  MOD r4, r12, r10
  AND r12, r3, r7
  POP r3
  POP r6
  POP r9
  MOD r13, r10, r11
  SHL r3, r11, r0
  OR r5, r11, r10
  SUB r15, r9, r8
  SHL r13, r10, r9
  DIV r8, r14, r6
  PUSH r8
  PUSH r14
  SHL r2, r14, r10
  SUB r14, r6, r2
  MOD r8, r15, r6
  MUL r20, r15, r2
  POP r14
  POP r8
  HALT
