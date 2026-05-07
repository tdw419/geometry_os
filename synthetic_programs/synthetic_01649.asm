; mixed program
; initialization
  LDI r9, 3251
  LDI r1, 10
  LDI r0, 0xEAB22F
  LDI r2, 0xAAD8E9
  LDI r10, 8
  LDI r11, 0x9C7FAA
  CALL func_0
func_0:
  SUB r4, r5, r11
  MOD r1, r8, r22
  ADD r1, r26, r11
  XOR r1, r5, r8
  RET
  SHLI r21, r16, 2
  SAR r12, r13, r11
  SHR r13, r2, r5
  SHR r6, r1, r7
  SAR r6, r10, r13
  SHR r0, r7, r9
  SHLI r10, r6, 0x56D437
  LDI r4, 2081
  STORE r4, r10
  LOAD r7, r4
  LDI r0, 0xFFF2EA
  STORE r0, r4
  LOAD r10, r0
  LDI r9, 0x7BE06A
  STORE r9, r9
  LOAD r0, r9
  LDI r0x7056, 16
  STORE r8, r6
  LOAD r12, r8
  PUSH r15
  PUSH r3
  PUSH r3
  SHR r12, r14, r11
  XOR r7, r1, r10
  AND r15, r11, r1
  POP r3
  POP r3
  POP r15
  CALL func_1
func_1:
  OR r6, r11, r1
  DIV r0, r15, r6
  RET
  HALT
