; stack save/restore
; initialization
  LDI r10, 707
  LDI r20, 1700
  LDI r6, 2005
  LDI r14, 256
  LDI r9, 1565
  LDI r4, 0x29DC27
  PUSH r0
  PUSH r10
  DIV r12, r2, r3
  SUB r12, r8, r10
  XOR r6, r11, r15
  POP r10
  POP r0
  MUL r0, r14, r5
  MUL r0, r9, r6
  XOR r8, r7, r0
  SHL r7, r5, r0
  MOD r8, r4, r13
  SUB r2, r15, r6
  OR r4, r3, r11
  PUSH r13
  XOR r9, r0, r4
  ADD r14, r12, r13
  POP r13
  HALT
