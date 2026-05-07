; stack save/restore
; initialization
  LDI r15, 2
  LDI r1, 3320
  LDI r5, 3927
  LDI r9, 0x15A807
  LDI r11, 0x2A446F
  LDI r30, 0x4C0D6C
  LDI r10, 10
  PUSH r13
  PUSH r4
  SHL r10, r11, r29
  DIV r8, r7, r29
  DIV r6, r5, r15
  POP r4
  POP r13
  SUB r4, r20, r6
  MUL r1, r5, r8
  SHL r10, r4, r14
  DIV r2, r29, r1
  SHR r8, r14, r15
  PUSH r4
  SHL r4, r12, r14
  SUB r5, r13, r6
  SHR r7, r0, r2
  XOR r15, r8, r23
  POP r4
  HALT
