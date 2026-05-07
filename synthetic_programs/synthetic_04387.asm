; stack save/restore
; initialization
  LDI r4, 1411
  LDI r3, 10
  LDI r15, 255
  LDI r11, 4
  LDI r1, 0xB0218C
  LDI r7, 3307
  LDI r14, 3594
  LDI r2, 0xF98908
  PUSH r11
  SHR r12, r10, r0
  MOD r0, r15, r9
  SHL r7, r4, r12
  XOR r26, r6, r2
  XOR r13, r3, r4
  POP r11
  SUB r2, r12, r11
  SHR r7, r4, r15
  AND r11, r15, r6
  SHL r10, r8, r22
  SHL r12, r8, r10
  OR r3, r10, r11
  DIV r3, r13, r14
  PUSH r8
  PUSH r12
  PUSH r1
  PUSH r11
  XOR r4, r7, r19
  SHR r0, r9, r4
  OR r4, r6, r15
  OR r27, r12, r3
  AND r11, r8, r6
  POP r11
  POP r1
  POP r12
  POP r8
  HALT
