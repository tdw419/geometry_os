; stack save/restore
; initialization
  LDI r4, 2
  LDI r12, 4
  LDI r15, 0x2B08D5
  LDI r2, 4
  LDI r21, 983
  LDI r14, 32
  LDI r0, 0xB403F4
  LDI r13, 0
  PUSH r6
  PUSH r27
  PUSH r2
  PUSH r15
  XOR r5, r2, r6
  SHL r4, r2, r14
  MUL r15, r12, r21
  XOR r3, r8, r6
  XOR r0, r10, r5
  POP r15
  POP r2
  POP r27
  POP r6
  SHR r6, r7, r9
  MUL r2, r14, r20
  DIV r12, r1, r2
  PUSH r15
  SUB r7, r14, r13
  MOD r11, r13, r6
  SHR r3, r11, r12
  POP r15
  HALT
