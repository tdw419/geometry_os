; stack save/restore
; initialization
  LDI r13, 0xD1E719
  LDI r12, 4
  LDI r4, 883
  LDI r11, 1
  LDI r2, 256
  LDI r8, 2275
  LDI r10, 0xE57972
  LDI r1, 49
  PUSH r11
  DIV r3, r13, r8
  SHR r7, r14, r9
  SHR r15, r10, r14
  XOR r3, r10, r1
  POP r11
  MUL r10, r9, r13
  MUL r8, r11, r9
  SHL r12, r8, r0
  SHR r4, r1, r11
  MUL r12, r4, r6
  XOR r0, r20, r12
  MOD r3, r11, r12
  MOD r11, r3, r7
  PUSH r15
  PUSH r1
  MUL r4, r10, r24
  XOR r12, r9, r4
  AND r10, r15, r9
  MOD r5, r14, r7
  POP r1
  POP r15
  HALT
