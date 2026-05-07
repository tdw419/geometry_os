; stack save/restore
; initialization
  LDI r1, 256
  LDI r9, 0xFB2751
  LDI r5, 0xB20017
  LDI r4, 2
  LDI r12, 0x1FB707
  LDI r3, 1799
  PUSH r4
  PUSH r13
  PUSH r1
  XOR r4, r7, r9
  MUL r10, r15, r25
  POP r1
  POP r13
  POP r4
  SHR r8, r10, r2
  MOD r4, r12, r11
  DIV r8, r3, r15
  PUSH r3
  PUSH r6
  PUSH r0
  PUSH r12
  ADD r10, r15, r13
  SHL r10, r9, r2
  MOD r4, r2, r9
  DIV r7, r11, r4
  POP r12
  POP r0
  POP r6
  POP r3
  HALT
