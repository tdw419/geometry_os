; stack save/restore
; initialization
  LDI r5, 8
  LDI r10, 0
  LDI r2, 2091
  LDI r11, 32
  LDI r1, 0x23B00E
  PUSH r11
  MUL r4, r5, r31
  AND r1, r17, r12
  MUL r5, r15, r10
  POP r11
  SHR r9, r14, r7
  MOD r0, r12, r11
  AND r14, r10, r13
  AND r7, r15, r4
  SHL r13, r4, r0
  PUSH r13
  PUSH r3
  AND r14, r12, r1
  SUB r1, r4, r2
  POP r3
  POP r13
  HALT
