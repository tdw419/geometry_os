; mixed program
; initialization
  LDI r0, 10
  LDI r4, 0x9BEDD3
  LDI r10, 10
  LDI r5, 0x803FFE
  LDI r7, 1943
  LDI r6, 1
  LDI r9, 1235
  LDI r15, 32
  SHR r9, r8, r25
  SHL r10, r14, r5
  SHLI r19, r13, 6
  SHL r1, r9, r11
  LDI r8, 0xC4A1BA
  STORE r8, r0
  LOAD r20, r8
  LDI r5, 3033
  STORE r5, r13
  LOAD r12, r5
  LDI r5, 2921
  STORE r5, r1
  LOAD r12, r5
  LDI r10, 0xB5D04A
  STORE r10, r8
  LOAD r7, r10
  CALL func_0
func_0:
  ADD r13, r15, r4
  MOD r7, r0, r1
  SUB r1, r7, r9
  MUL r5, r9, r2
  MUL r6, r8, r3
  RET
  HALT
