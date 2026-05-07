; stack save/restore
; initialization
  LDI r12, 0x3A7BDB
  LDI r9, 3261
  LDI r10, 0
  PUSH r4
  PUSH r11
  PUSH r4
  PUSH r10
  SHL r4, r10, r5
  AND r12, r7, r15
  POP r10
  POP r4
  POP r11
  POP r4
  XOR r5, r4, r0
  SUB r0, r9, r4
  AND r2, r9, r14
  SHR r10, r9, r12
  MOD r2, r10, r7
  OR r0, r11, r2
  MUL r10, r4, r1
  OR r6, r2, r8
  PUSH r10
  PUSH r3
  PUSH r22
  MOD r14, r8, r6
  SHR r2, r14, r8
  OR r14, r5, r11
  POP r22
  POP r3
  POP r10
  HALT
