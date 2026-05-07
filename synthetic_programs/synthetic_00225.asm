; stack save/restore
; initialization
  LDI r2, 1
  LDI r3, 255
  LDI r4, 1884
  LDI r7, 0x5D3D79
  LDI r15, 487
  LDI r9, 16
  LDI r12, 3314
  LDI r1, 10
  PUSH r4
  PUSH r6
  ADD r12, r3, r0
  MOD r13, r2, r15
  SUB r7, r10, r11
  ADD r0, r10, r1
  SHR r14, r12, r7
  POP r6
  POP r4
  XOR r11, r1, r4
  XOR r18, r0, r11
  AND r14, r5, r6
  OR r12, r2, r11
  DIV r12, r9, r10
  XOR r4, r28, r14
  SHR r12, r6, r4
  MOD r12, r13, r1
  PUSH r12
  AND r9, r2, r15
  MUL r4, r8, r6
  SHL r12, r0, r9
  POP r12
  HALT
