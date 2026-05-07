; stack save/restore
; initialization
  LDI r14, 0xDA49BD
  LDI r8, 1532
  LDI r11, 0x8456E5
  LDI r5, 243
  LDI r4, 947
  LDI r15, 3831
  LDI r9, 3607
  LDI r1, 8
  PUSH r7
  PUSH r11
  PUSH r15
  PUSH r12
  ADD r11, r8, r9
  SHL r13, r3, r8
  POP r12
  POP r15
  POP r11
  POP r7
  SHL r11, r0, r15
  ADD r2, r3, r14
  MOD r9, r6, r8
  SHL r19, r2, r5
  SUB r12, r1, r8
  PUSH r3
  PUSH r8
  PUSH r2
  PUSH r13
  XOR r9, r11, r14
  SHR r15, r5, r13
  POP r13
  POP r2
  POP r8
  POP r3
  HALT
