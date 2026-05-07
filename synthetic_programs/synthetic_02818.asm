; stack save/restore
; initialization
  LDI r3, 0x2BF8FF
  LDI r2, 0x4779B7
  LDI r12, 64
  PUSH r14
  PUSH r12
  XOR r24, r2, r0
  MOD r9, r14, r11
  POP r12
  POP r14
  SHL r9, r0, r12
  XOR r11, r10, r15
  SUB r12, r15, r4
  MOD r4, r3, r11
  XOR r15, r4, r7
  MUL r12, r0, r2
  PUSH r13
  PUSH r19
  PUSH r13
  SHL r5, r11, r13
  SHR r3, r1, r15
  SHR r9, r10, r11
  SUB r4, r9, r13
  ADD r6, r2, r14
  POP r13
  POP r19
  POP r13
  HALT
