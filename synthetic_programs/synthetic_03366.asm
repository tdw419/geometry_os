; stack save/restore
; initialization
  LDI r5, 255
  LDI r27, 16
  LDI r18, 2
  PUSH r9
  PUSH r10
  ADD r14, r10, r3
  ADD r14, r6, r3
  SHR r0, r9, r14
  DIV r14, r1, r7
  ADD r1, r5, r7
  POP r10
  POP r9
  AND r6, r12, r0
  OR r10, r13, r23
  SHR r14, r9, r22
  SHL r6, r14, r2
  ADD r14, r7, r5
  PUSH r4
  SHR r6, r3, r2
  ADD r14, r2, r21
  DIV r6, r10, r11
  DIV r2, r23, r13
  POP r4
  HALT
