; stack save/restore
; initialization
  LDI r0, 2
  LDI r5, 255
  LDI r14, 0x4A5C12
  LDI r2, 255
  LDI r12, 256
  LDI r1, 16
  LDI r7, 256
  LDI r15, 256
  PUSH r1
  PUSH r15
  PUSH r2
  MUL r4, r5, r12
  DIV r31, r3, r7
  POP r2
  POP r15
  POP r1
  XOR r14, r8, r0
  XOR r12, r9, r5
  DIV r12, r13, r4
  XOR r13, r28, r0
  AND r12, r6, r2
  MUL r0, r7, r1
  SHR r6, r2, r7
  PUSH r5
  PUSH r6
  OR r8, r14, r2
  SHL r10, r14, r0
  SHR r2, r4, r7
  POP r6
  POP r5
  HALT
