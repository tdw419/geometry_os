; stack save/restore
; initialization
  LDI r4, 0x426014
  LDI r9, 0xC3B52D
  PUSH r3
  PUSH r2
  PUSH r1
  PUSH r3
  OR r0, r13, r1
  OR r5, r4, r9
  MOD r1, r12, r13
  POP r3
  POP r1
  POP r2
  POP r3
  SHL r12, r9, r4
  ADD r8, r4, r12
  DIV r7, r9, r3
  PUSH r12
  XOR r8, r7, r13
  ADD r0, r2, r3
  SUB r4, r12, r20
  MOD r13, r6, r1
  DIV r8, r2, r3
  POP r12
  HALT
