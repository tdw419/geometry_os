; stack save/restore
; initialization
  LDI r13, 256
  LDI r5, 567
  LDI r6, 959
  LDI r9, 2686
  PUSH r2
  PUSH r12
  PUSH r2
  OR r1, r2, r14
  ADD r2, r14, r24
  POP r2
  POP r12
  POP r2
  OR r7, r1, r14
  SUB r13, r5, r0
  DIV r3, r11, r0
  OR r11, r5, r13
  PUSH r10
  PUSH r13
  XOR r10, r0, r1
  SUB r9, r6, r10
  POP r13
  POP r10
  HALT
