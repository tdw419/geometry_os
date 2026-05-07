; stack save/restore
; initialization
  LDI r5, 64
  LDI r12, 0
  PUSH r10
  PUSH r14
  PUSH r2
  PUSH r14
  ADD r11, r9, r13
  SHR r0, r8, r2
  MOD r5, r11, r12
  MUL r15, r11, r6
  AND r5, r15, r11
  POP r14
  POP r2
  POP r14
  POP r10
  DIV r14, r4, r2
  SHR r12, r14, r10
  MUL r0, r12, r8
  DIV r13, r6, r11
  SUB r9, r7, r1
  PUSH r9
  PUSH r11
  PUSH r15
  PUSH r20
  DIV r8, r11, r13
  OR r13, r0, r31
  SUB r15, r8, r24
  SHL r0, r13, r7
  POP r20
  POP r15
  POP r11
  POP r9
  HALT
