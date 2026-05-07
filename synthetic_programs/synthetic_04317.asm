; stack save/restore
; initialization
  LDI r4, 0
  LDI r0, 0xC1CF37
  LDI r14, 2031
  LDI r5, 0x5527DB
  LDI r9, 8
  PUSH r12
  ADD r9, r8, r20
  MUL r11, r17, r1
  AND r13, r6, r12
  XOR r7, r11, r0
  POP r12
  SUB r2, r14, r3
  SHL r0, r4, r17
  SHR r0, r8, r4
  SUB r6, r10, r4
  OR r1, r6, r5
  MOD r4, r5, r9
  PUSH r14
  PUSH r11
  PUSH r6
  SHL r13, r8, r12
  DIV r9, r8, r4
  ADD r5, r2, r6
  SUB r8, r3, r15
  ADD r9, r1, r10
  POP r6
  POP r11
  POP r14
  HALT
