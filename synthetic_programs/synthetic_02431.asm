; stack save/restore
; initialization
  LDI r12, 255
  LDI r1, 593
  LDI r4, 0x6C7C92
  LDI r9, 3815
  LDI r6, 256
  LDI r3, 8
  LDI r5, 64
  LDI r7, 2754
  PUSH r0
  PUSH r0
  PUSH r0
  OR r27, r13, r31
  AND r2, r15, r4
  POP r0
  POP r0
  POP r0
  XOR r21, r11, r9
  AND r6, r1, r0
  AND r11, r12, r0
  DIV r9, r11, r10
  ADD r9, r14, r4
  XOR r1, r0, r8
  ADD r12, r9, r15
  PUSH r1
  PUSH r15
  AND r1, r0, r6
  DIV r3, r6, r13
  MUL r7, r15, r13
  SUB r5, r1, r14
  ADD r8, r1, r3
  POP r15
  POP r1
  HALT
