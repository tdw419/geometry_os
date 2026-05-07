; stack save/restore
; initialization
  LDI r15, 0x5C7151
  LDI r2, 256
  PUSH r6
  PUSH r7
  PUSH r0
  PUSH r3
  SHL r5, r3, r7
  MUL r31, r5, r11
  MOD r12, r6, r7
  ADD r15, r14, r10
  POP r3
  POP r0
  POP r7
  POP r6
  MOD r10, r15, r5
  MUL r15, r5, r8
  DIV r11, r3, r15
  DIV r5, r9, r4
  PUSH r5
  MUL r12, r4, r2
  ADD r14, r21, r2
  MUL r8, r14, r5
  OR r9, r5, r7
  POP r5
  HALT
