; mixed program
; initialization
  LDI r2, 2248
  LDI r9, 344
  PUSH r0
  PUSH r2
  PUSH r0
  PUSH r22
  AND r8, r12, r1
  SHL r0, r3, r13
  XOR r3, r14, r9
  DIV r15, r2, r0
  POP r22
  POP r0
  POP r2
  POP r0
  PUSH r7
  PUSH r14
  MOD r4, r1, r6
  OR r19, r6, r3
  POP r14
  POP r7
  LDI r7, 0x4C4859
  LDI r3, 719
  LDI r8, 128
  DRAWTEXT r7, r3, r8, "WORLD"
  HALT
