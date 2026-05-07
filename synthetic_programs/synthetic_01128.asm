; stack save/restore
; initialization
  LDI r6, 0x250109
  LDI r8, 128
  LDI r13, 0xDCF67B
  LDI r3, 599
  PUSH r2
  SHR r10, r2, r9
  ADD r7, r13, r12
  SUB r2, r5, r3
  MUL r4, r13, r10
  POP r2
  XOR r13, r8, r5
  DIV r10, r12, r15
  SHL r4, r5, r13
  MOD r8, r21, r15
  SHR r1, r10, r14
  OR r3, r23, r0
  XOR r5, r15, r7
  PUSH r13
  PUSH r9
  PUSH r14
  PUSH r7
  OR r11, r2, r0
  SHR r14, r21, r5
  POP r7
  POP r14
  POP r9
  POP r13
  HALT
