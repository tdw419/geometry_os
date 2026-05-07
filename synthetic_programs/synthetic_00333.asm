; stack save/restore
; initialization
  LDI r14, 32
  LDI r4, 0x1B8CBF
  LDI r7, 256
  PUSH r3
  PUSH r30
  ADD r7, r12, r0
  SUB r4, r10, r12
  ADD r13, r29, r2
  POP r30
  POP r3
  OR r7, r5, r15
  SHR r6, r0, r13
  DIV r6, r11, r12
  PUSH r15
  PUSH r10
  PUSH r0
  PUSH r10
  XOR r6, r5, r1
  SHL r27, r9, r2
  POP r10
  POP r0
  POP r10
  POP r15
  HALT
