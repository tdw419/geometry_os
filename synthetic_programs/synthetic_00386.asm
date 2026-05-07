; stack save/restore
; initialization
  LDI r7, 2053
  LDI r5, 2
  LDI r9, 0x024604
  LDI r14, 4
  LDI r3, 403
  LDI r10, 0xC33023
  LDI r11, 255
  LDI r13, 176
  PUSH r25
  PUSH r3
  PUSH r14
  PUSH r1
  SHR r15, r4, r0
  SUB r13, r6, r7
  MUL r30, r13, r2
  POP r1
  POP r14
  POP r3
  POP r25
  MOD r21, r10, r2
  XOR r15, r14, r18
  ADD r6, r7, r4
  SUB r15, r8, r10
  SUB r13, r3, r24
  PUSH r1
  PUSH r2
  MOD r3, r10, r12
  SHL r10, r6, r12
  SHR r3, r2, r14
  MOD r0, r1, r3
  POP r2
  POP r1
  HALT
