; stack save/restore
; initialization
  LDI r2, 0x30E4FE
  LDI r7, 0xD1E03A
  LDI r12, 334
  LDI r11, 255
  LDI r10, 0xC6388E
  LDI r30, 0xBA1AB2
  PUSH r15
  PUSH r11
  PUSH r2
  PUSH r9
  OR r4, r8, r3
  SHL r4, r1, r2
  POP r9
  POP r2
  POP r11
  POP r15
  SHR r5, r10, r8
  SHR r2, r9, r14
  OR r10, r15, r8
  SUB r15, r5, r9
  SUB r6, r10, r3
  XOR r11, r6, r9
  XOR r13, r8, r4
  MUL r1, r3, r9
  PUSH r13
  PUSH r11
  AND r13, r7, r11
  DIV r0, r2, r12
  SHR r13, r2, r3
  MUL r9, r7, r5
  DIV r8, r11, r3
  POP r11
  POP r13
  HALT
