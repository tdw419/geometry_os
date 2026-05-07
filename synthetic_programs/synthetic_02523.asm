; stack save/restore
; initialization
  LDI r10, 0x0F2ACA
  LDI r15, 0x4CC185
  LDI r12, 128
  PUSH r2
  PUSH r3
  MUL r3, r13, r4
  DIV r8, r9, r7
  MOD r12, r9, r11
  OR r20, r3, r2
  XOR r14, r7, r10
  POP r3
  POP r2
  ADD r4, r14, r9
  OR r13, r9, r7
  XOR r20, r8, r15
  MOD r1, r13, r11
  DIV r18, r5, r11
  MUL r12, r3, r6
  MUL r9, r15, r12
  OR r1, r14, r25
  PUSH r11
  SHL r13, r12, r2
  MUL r5, r2, r7
  POP r11
  HALT
