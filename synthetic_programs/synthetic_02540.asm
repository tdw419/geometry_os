; stack save/restore
; initialization
  LDI r13, 3739
  LDI r7, 0x191EB5
  LDI r5, 256
  LDI r3, 0xDD8D99
  LDI r14, 16
  LDI r8, 0x0EA13F
  LDI r9, 2216
  LDI r11, 2954
  PUSH r7
  PUSH r27
  PUSH r11
  PUSH r13
  MOD r0, r4, r12
  MOD r11, r15, r14
  POP r13
  POP r11
  POP r27
  POP r7
  SUB r22, r15, r26
  MOD r12, r7, r10
  SUB r3, r13, r10
  AND r13, r11, r4
  MOD r3, r15, r12
  MUL r5, r1, r14
  SHR r9, r7, r10
  PUSH r4
  PUSH r8
  PUSH r8
  PUSH r4
  DIV r15, r22, r8
  SHR r3, r15, r0
  DIV r5, r9, r0
  SUB r6, r3, r20
  SHR r0, r7, r2
  POP r4
  POP r8
  POP r8
  POP r4
  HALT
