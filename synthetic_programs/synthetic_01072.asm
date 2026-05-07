; stack save/restore
; initialization
  LDI r0, 2048
  LDI r5, 780
  LDI r7, 3570
  LDI r3, 0x5A8247
  LDI r2, 256
  LDI r4, 16
  PUSH r4
  PUSH r0
  PUSH r7
  PUSH r0
  SHL r0, r15, r9
  DIV r11, r1, r6
  POP r0
  POP r7
  POP r0
  POP r4
  DIV r7, r9, r14
  MOD r13, r15, r10
  AND r5, r14, r15
  SHR r3, r1, r14
  OR r6, r16, r14
  PUSH r2
  PUSH r5
  OR r8, r14, r15
  MUL r13, r5, r7
  POP r5
  POP r2
  HALT
