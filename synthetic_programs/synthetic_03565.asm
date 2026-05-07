; stack save/restore
; initialization
  LDI r0, 16
  LDI r30, 0x462240
  LDI r12, 0xBE412D
  LDI r2, 0x564532
  LDI r4, 516
  LDI r13, 0xA1B13D
  PUSH r12
  PUSH r7
  PUSH r8
  PUSH r12
  ADD r0, r11, r2
  ADD r2, r12, r6
  DIV r1, r9, r11
  MOD r8, r0, r5
  XOR r5, r15, r2
  POP r12
  POP r8
  POP r7
  POP r12
  SHL r6, r10, r0
  ADD r0, r13, r5
  SHR r0, r5, r15
  AND r4, r1, r7
  MUL r9, r11, r0
  MOD r15, r4, r2
  XOR r25, r1, r15
  PUSH r11
  PUSH r6
  PUSH r4
  ADD r2, r14, r11
  DIV r0, r6, r1
  AND r7, r8, r5
  AND r0, r10, r14
  SUB r4, r7, r3
  POP r4
  POP r6
  POP r11
  HALT
