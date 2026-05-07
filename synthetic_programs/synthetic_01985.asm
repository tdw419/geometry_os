; stack save/restore
; initialization
  LDI r15, 0x13CA0F
  LDI r12, 0xDBB934
  LDI r6, 1619
  LDI r14, 128
  LDI r1, 16
  LDI r11, 2876
  PUSH r3
  PUSH r3
  PUSH r7
  PUSH r4
  SHR r6, r15, r3
  SHL r13, r3, r10
  POP r4
  POP r7
  POP r3
  POP r3
  MUL r13, r15, r3
  XOR r6, r9, r11
  DIV r13, r2, r5
  SHL r1, r12, r4
  DIV r4, r13, r12
  MOD r3, r8, r15
  PUSH r6
  PUSH r14
  DIV r14, r7, r11
  SHR r13, r11, r1
  SHL r8, r0, r15
  XOR r3, r1, r7
  POP r14
  POP r6
  HALT
