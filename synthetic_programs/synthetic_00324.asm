; stack save/restore
; initialization
  LDI r14, 0xA77862
  LDI r0, 2128
  LDI r1, 64
  LDI r9, 0x7FDBFA
  PUSH r13
  AND r7, r9, r4
  MOD r9, r3, r0
  POP r13
  DIV r7, r15, r11
  MOD r8, r3, r14
  DIV r2, r7, r10
  OR r0, r4, r2
  MUL r15, r10, r0
  XOR r14, r15, r8
  ADD r0, r5, r1
  SHR r3, r12, r9
  PUSH r7
  SHR r4, r10, r5
  DIV r12, r5, r17
  ADD r11, r0, r3
  OR r0, r7, r10
  DIV r4, r12, r15
  POP r7
  HALT
