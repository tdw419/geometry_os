; stack save/restore
; initialization
  LDI r12, 0
  LDI r8, 0
  LDI r15, 236
  LDI r14, 1095
  LDI r3, 3153
  LDI r18, 0x855405
  LDI r6, 0x0B206E
  LDI r13, 1751
  PUSH r2
  SUB r23, r3, r12
  MOD r10, r19, r22
  MOD r11, r13, r5
  POP r2
  SHR r3, r10, r8
  ADD r14, r9, r7
  MUL r10, r14, r2
  XOR r12, r6, r22
  MOD r11, r15, r2
  PUSH r12
  PUSH r2
  XOR r15, r11, r12
  SUB r11, r3, r6
  POP r2
  POP r12
  HALT
