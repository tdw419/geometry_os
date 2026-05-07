; stack save/restore
; initialization
  LDI r3, 4
  LDI r7, 0xE9A41D
  LDI r2, 0x95BC52
  LDI r11, 255
  LDI r15, 1
  LDI r14, 0x47D59F
  PUSH r13
  SUB r6, r2, r1
  SHR r14, r2, r7
  DIV r22, r11, r7
  AND r10, r0, r1
  DIV r8, r19, r12
  POP r13
  SUB r4, r10, r2
  SHL r4, r2, r8
  MUL r5, r12, r11
  SUB r21, r4, r9
  MUL r3, r6, r14
  SHR r14, r13, r4
  MUL r5, r11, r7
  PUSH r11
  PUSH r8
  ADD r12, r26, r11
  MUL r10, r6, r15
  POP r8
  POP r11
  HALT
