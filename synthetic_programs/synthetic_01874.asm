; mixed program
; initialization
  LDI r4, 4
  LDI r6, 3259
  LDI r15, 495
  LDI r11, 1319
  LDI r12, 2
  LDI r1, 0x8DD631
  LDI r9, 0
  STORE r9, r12
  LOAD r6, r9
  LDI r12, 2342
  STORE r12, r13
  LOAD r4, r12
  LDI r6, 994
  STORE r6, r14
  LOAD r9, r6
  LDI r9, 2625
  STORE r9, r1
  LOAD r2, r9
  SHLI r6, r8, 6
  SHLI r0, r6, 16
  CALL func_0
func_0:
  MOD r2, r10, r14
  MUL r9, r10, r3
  AND r3, r1, r7
  RET
  HALT
