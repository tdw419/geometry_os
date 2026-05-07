; stack save/restore
; initialization
  LDI r4, 3553
  LDI r7, 0x92F2EA
  LDI r8, 0xC8A640
  LDI r12, 16
  PUSH r2
  MUL r13, r0, r12
  MOD r3, r0, r15
  MUL r1, r4, r2
  POP r2
  ADD r11, r6, r4
  DIV r4, r0, r10
  XOR r6, r2, r14
  MOD r11, r7, r15
  SHL r0, r14, r9
  SHR r15, r11, r1
  SUB r15, r0, r4
  MUL r9, r8, r1
  PUSH r4
  PUSH r30
  PUSH r2
  PUSH r1
  OR r5, r12, r15
  SUB r14, r0, r1
  MOD r8, r1, r10
  MUL r0, r1, r4
  POP r1
  POP r2
  POP r30
  POP r4
  HALT
