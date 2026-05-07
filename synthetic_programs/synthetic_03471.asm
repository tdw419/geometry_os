; stack save/restore
; initialization
  LDI r0, 0x190AD4
  LDI r14, 64
  LDI r1, 4
  LDI r5, 0x5AFD04
  PUSH r3
  PUSH r9
  PUSH r3
  XOR r1, r6, r10
  MUL r6, r3, r13
  MUL r12, r8, r11
  SHR r15, r5, r4
  AND r23, r2, r10
  POP r3
  POP r9
  POP r3
  MUL r10, r13, r2
  AND r14, r7, r12
  OR r6, r15, r14
  PUSH r20
  PUSH r10
  MUL r10, r2, r16
  SHL r0, r14, r8
  POP r10
  POP r20
  HALT
