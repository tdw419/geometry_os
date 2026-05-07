; stack save/restore
; initialization
  LDI r1, 255
  LDI r3, 256
  LDI r10, 1
  LDI r6, 0xCCFD82
  LDI r7, 1499
  PUSH r3
  MOD r8, r3, r12
  SHR r8, r2, r21
  OR r0, r13, r2
  SUB r12, r13, r3
  POP r3
  AND r11, r3, r4
  SHR r15, r7, r10
  AND r30, r3, r14
  PUSH r6
  SHL r8, r6, r10
  SUB r15, r14, r5
  XOR r2, r14, r10
  MUL r13, r3, r2
  POP r6
  HALT
