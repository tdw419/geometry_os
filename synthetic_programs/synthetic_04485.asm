; stack save/restore
; initialization
  LDI r14, 0x748EBA
  LDI r2, 1338
  LDI r10, 128
  LDI r13, 16
  LDI r27, 796
  PUSH r8
  PUSH r12
  PUSH r12
  PUSH r7
  ADD r13, r5, r0
  XOR r10, r5, r14
  DIV r12, r14, r8
  SHR r10, r11, r14
  MOD r8, r7, r15
  POP r7
  POP r12
  POP r12
  POP r8
  AND r7, r4, r5
  OR r4, r10, r11
  XOR r1, r6, r5
  AND r10, r13, r11
  MUL r12, r13, r18
  PUSH r21
  PUSH r1
  PUSH r4
  PUSH r4
  DIV r13, r8, r15
  MOD r5, r9, r4
  POP r4
  POP r4
  POP r1
  POP r21
  HALT
