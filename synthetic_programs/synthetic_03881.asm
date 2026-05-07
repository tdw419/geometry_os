; stack save/restore
; initialization
  LDI r14, 0x73AB6D
  LDI r29, 0xCFF424
  LDI r1, 32
  PUSH r12
  PUSH r6
  PUSH r0
  XOR r6, r3, r0
  AND r11, r12, r14
  XOR r0, r6, r15
  SHL r10, r9, r8
  POP r0
  POP r6
  POP r12
  AND r5, r4, r14
  SHR r14, r4, r9
  XOR r13, r3, r14
  SHR r8, r19, r12
  SHR r0, r15, r2
  DIV r10, r0, r3
  ADD r3, r1, r14
  XOR r0, r6, r9
  PUSH r1
  PUSH r4
  PUSH r10
  PUSH r14
  OR r7, r4, r9
  XOR r5, r1, r6
  AND r7, r14, r13
  SHL r13, r9, r12
  SHL r10, r2, r5
  POP r14
  POP r10
  POP r4
  POP r1
  HALT
