; mixed program
; initialization
  LDI r1, 8
  LDI r10, 3041
  LDI r5, 10
  LDI r2, 16
  LDI r15, 0x0F1700
  LDI r3, 4
  STORE r3, r2
  LOAD r8, r3
  LDI r2, 811
  STORE r2, r6
  LOAD r10, r2
  LDI r3, 1459
  STORE r3, r1
  LOAD r11, r3
  LDI r0, 64
  STORE r0, r7
  LOAD r9, r0
  LDI r8, 16
  STORE r8, r1
  LOAD r6, r8
  CMP r3, r13
  CALL func_0
func_0:
  SHR r8, r2, r13
  AND r25, r9, r14
  MOD r10, r0, r7
  RET
  PUSH r12
  PUSH r4
  PUSH r3
  XOR r9, r7, r25
  OR r5, r9, r10
  SHL r6, r2, r0
  XOR r13, r4, r3
  POP r3
  POP r4
  POP r12
  HALT
