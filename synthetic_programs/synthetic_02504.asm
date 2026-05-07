; mixed program
; initialization
  LDI r7, 0
  LDI r13, 2
  LDI r3, 32
  LDI r9, 1
  LDI r15, 1742
  CALL func_0
func_0:
  SHL r14, r7, r4
  SUB r8, r15, r9
  MOD r4, r14, r2
  SUB r10, r5, r14
  RET
  CALL func_1
func_1:
  XOR r15, r12, r9
  XOR r2, r0, r13
  RET
  SHLI r8, r13, 6
  SHLI r3, r8, 1
  CMP r25, r12
  LDI r3, 8
  STORE r3, r2
  LOAD r0, r3
  LDI r2, 255
  STORE r2, r4
  LOAD r9, r2
  LDI r5, 4
  STORE r5, r6
  LOAD r23, r5
  LDI r1, 64
  STORE r1, r2
  LOAD r0, r1
  LDI r15, 1520
  STORE r15, r7
  LOAD r14, r15
  HALT
