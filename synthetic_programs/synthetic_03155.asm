; stack save/restore
; initialization
  LDI r1, 0x8B43E3
  LDI r10, 8
  LDI r8, 10
  PUSH r18
  PUSH r14
  ADD r0, r2, r14
  MOD r11, r13, r1
  XOR r12, r10, r13
  OR r3, r14, r4
  SHR r13, r2, r10
  POP r14
  POP r18
  SUB r10, r11, r8
  SUB r11, r6, r14
  SHL r9, r3, r1
  SUB r8, r11, r4
  AND r6, r7, r5
  DIV r2, r3, r11
  SHL r0, r8, r11
  DIV r2, r10, r9
  PUSH r9
  PUSH r10
  PUSH r10
  PUSH r1
  MOD r13, r6, r3
  MUL r7, r6, r12
  OR r14, r12, r13
  POP r1
  POP r10
  POP r10
  POP r9
  HALT
