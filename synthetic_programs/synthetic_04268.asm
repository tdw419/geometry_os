; stack save/restore
; initialization
  LDI r13, 1452
  LDI r9, 128
  LDI r7, 0x0D981D
  LDI r5, 128
  LDI r10, 2411
  LDI r3, 267
  LDI r2, 0x5D9C0C
  PUSH r13
  PUSH r8
  AND r0, r22, r5
  ADD r12, r2, r4
  SHR r2, r3, r13
  POP r8
  POP r13
  XOR r3, r15, r28
  DIV r3, r11, r8
  OR r15, r12, r3
  MUL r0, r14, r10
  XOR r9, r3, r7
  DIV r0, r4, r3
  PUSH r7
  PUSH r8
  OR r0, r4, r14
  SHL r8, r7, r15
  ADD r7, r14, r10
  SHL r12, r10, r15
  MUL r14, r22, r9
  POP r8
  POP r7
  HALT
