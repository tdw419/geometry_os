; stack save/restore
; initialization
  LDI r13, 1007
  LDI r11, 0x93E24E
  LDI r20, 4
  LDI r9, 8
  LDI r22, 0x974F98
  LDI r0, 0x42F823
  LDI r6, 1683
  LDI r8, 0
  PUSH r1
  PUSH r11
  MOD r13, r9, r1
  MUL r5, r13, r2
  SHR r9, r5, r11
  POP r11
  POP r1
  MUL r1, r3, r10
  XOR r4, r9, r3
  MOD r6, r15, r12
  XOR r9, r13, r14
  SUB r15, r4, r2
  PUSH r7
  PUSH r11
  MOD r11, r22, r12
  SUB r11, r14, r0
  SUB r9, r4, r8
  SHL r8, r5, r10
  POP r11
  POP r7
  HALT
