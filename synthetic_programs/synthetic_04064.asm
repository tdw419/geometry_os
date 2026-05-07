; stack save/restore
; initialization
  LDI r12, 2
  LDI r5, 0x144EE6
  LDI r4, 1973
  PUSH r13
  PUSH r15
  PUSH r9
  PUSH r7
  DIV r4, r9, r15
  SHR r8, r25, r14
  SUB r14, r13, r0
  POP r7
  POP r9
  POP r15
  POP r13
  OR r13, r3, r9
  MOD r1, r11, r8
  MUL r13, r23, r10
  SUB r9, r12, r14
  SUB r5, r4, r12
  PUSH r3
  PUSH r12
  PUSH r12
  PUSH r11
  SHL r6, r7, r4
  MOD r8, r11, r14
  MOD r13, r14, r11
  MOD r1, r11, r0
  POP r11
  POP r12
  POP r12
  POP r3
  HALT
