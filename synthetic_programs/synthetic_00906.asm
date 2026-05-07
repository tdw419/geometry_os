; mixed program
; initialization
  LDI r12, 0x530CC1
  LDI r1, 825
  LDI r9, 135
  LDI r11, 1972
  LDI r8, 0x89814B
  LDI r10, 128
  LDI r7, 4074
  STORE r7, r8
  LOAD r9, r7
  LDI r9, 4
  STORE r9, r14
  LOAD r11, r9
  LDI r9, 1788
  STORE r9, r10
  LOAD r0, r9
  LDI r10, 3981
  STORE r10, r3
  LOAD r1, r10
  CALL func_0
func_0:
  DIV r4, r9, r8
  ADD r1, r6, r4
  SHL r0, r4, r6
  MOD r5, r14, r15
  SHR r9, r13, r15
  SUB r14, r9, r8
  RET
  CMP r9, r6
  PUSH r11
  OR r0, r14, r7
  DIV r13, r8, r14
  SHR r5, r11, r14
  POP r11
  LDI r8, 255
  LDI r5, 246
  LDI r5, 2278
  PSETI
  HALT
