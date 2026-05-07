; stack save/restore
; initialization
  LDI r2, 0x9DA809
  LDI r0, 1183
  LDI r8, 0x72692C
  LDI r15, 2924
  LDI r14, 0xF56684
  PUSH r15
  MUL r4, r8, r6
  MOD r12, r15, r7
  XOR r18, r11, r1
  POP r15
  SUB r5, r11, r9
  DIV r15, r7, r11
  SHL r7, r11, r13
  AND r4, r13, r3
  ADD r2, r5, r13
  SHR r1, r6, r13
  XOR r6, r10, r15
  PUSH r8
  ADD r1, r8, r7
  MOD r8, r13, r2
  POP r8
  HALT
