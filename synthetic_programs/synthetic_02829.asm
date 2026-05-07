; stack save/restore
; initialization
  LDI r1, 32
  LDI r3, 0x0DCC9E
  LDI r7, 64
  LDI r10, 0x830149
  LDI r0, 0x1B010C
  LDI r4, 3547
  LDI r13, 0xAB57F2
  PUSH r13
  PUSH r5
  PUSH r10
  PUSH r5
  ADD r9, r8, r5
  SHL r11, r10, r6
  POP r5
  POP r10
  POP r5
  POP r13
  XOR r0, r26, r15
  SHL r2, r4, r7
  MOD r8, r21, r10
  DIV r14, r0, r1
  XOR r9, r10, r15
  SUB r21, r11, r13
  MOD r2, r12, r13
  SUB r10, r14, r8
  PUSH r11
  PUSH r12
  PUSH r1
  PUSH r11
  MUL r0, r10, r8
  SHL r15, r4, r11
  ADD r5, r8, r12
  OR r3, r12, r15
  POP r11
  POP r1
  POP r12
  POP r11
  HALT
