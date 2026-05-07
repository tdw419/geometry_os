; stack save/restore
; initialization
  LDI r0, 3560
  LDI r6, 0x1FC2D0
  LDI r10, 1
  LDI r4, 4
  PUSH r12
  PUSH r14
  PUSH r3
  PUSH r13
  SHR r1, r3, r7
  MOD r11, r13, r5
  MOD r6, r27, r2
  XOR r2, r4, r12
  SUB r3, r16, r11
  POP r13
  POP r3
  POP r14
  POP r12
  SUB r1, r21, r5
  OR r12, r15, r0
  SHL r5, r14, r9
  PUSH r15
  ADD r15, r10, r3
  MUL r3, r0, r1
  POP r15
  HALT
