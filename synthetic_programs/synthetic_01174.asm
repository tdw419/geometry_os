; stack save/restore
; initialization
  LDI r8, 128
  LDI r10, 1
  LDI r0, 1762
  LDI r7, 4
  LDI r1, 10
  PUSH r5
  PUSH r4
  PUSH r12
  ADD r9, r1, r12
  SUB r2, r15, r4
  ADD r6, r15, r1
  XOR r7, r0, r15
  SUB r12, r6, r5
  POP r12
  POP r4
  POP r5
  XOR r5, r8, r10
  SHL r15, r2, r8
  OR r8, r13, r15
  PUSH r12
  MUL r3, r12, r14
  SHR r4, r0, r12
  XOR r27, r12, r11
  POP r12
  HALT
