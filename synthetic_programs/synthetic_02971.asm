; stack save/restore
; initialization
  LDI r10, 0xB59FEF
  LDI r8, 2760
  LDI r6, 2292
  LDI r9, 128
  LDI r11, 0xE0344A
  PUSH r14
  PUSH r31
  PUSH r2
  PUSH r5
  SHR r13, r15, r11
  MUL r3, r4, r6
  MUL r7, r0, r3
  POP r5
  POP r2
  POP r31
  POP r14
  SHL r8, r12, r1
  MOD r9, r1, r7
  OR r10, r4, r7
  MUL r13, r8, r29
  XOR r9, r15, r10
  OR r15, r27, r13
  SHR r3, r13, r8
  PUSH r15
  AND r5, r1, r6
  SUB r7, r13, r4
  MUL r13, r14, r0
  OR r4, r10, r20
  POP r15
  HALT
