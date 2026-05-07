; stack save/restore
; initialization
  LDI r16, 0x02A6A6
  LDI r14, 2113
  LDI r15, 128
  LDI r7, 0x6F67A0
  LDI r5, 2650
  LDI r4, 3760
  LDI r3, 0x58490E
  PUSH r19
  PUSH r9
  ADD r11, r5, r4
  XOR r12, r15, r0
  AND r9, r1, r11
  SHR r12, r2, r0
  POP r9
  POP r19
  XOR r11, r10, r12
  DIV r6, r12, r19
  MUL r5, r3, r4
  DIV r2, r9, r7
  AND r6, r13, r0
  SHR r9, r10, r12
  PUSH r12
  PUSH r5
  PUSH r0
  ADD r14, r6, r11
  MUL r15, r3, r7
  POP r0
  POP r5
  POP r12
  HALT
