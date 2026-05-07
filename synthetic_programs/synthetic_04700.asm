; mixed program
; initialization
  LDI r16, 0x8BFE4F
  LDI r4, 0xEF3CF3
  LDI r5, 0x6EFA0E
  LDI r4, 0x557280
  STORE r4, r14
  LOAD r12, r4
  LDI r3, 0xBEC4FD
  STORE r3, r0
  LOAD r13, r3
  LDI r3, 10
  STORE r3, r6
  LOAD r13, r3
  LDI r6, 10
  STORE r6, r6
  LOAD r11, r6
  CALL func_0
func_0:
  XOR r15, r22, r3
  ADD r4, r6, r3
  SUB r8, r0, r9
  RET
  LDI r15, 64
  LDI r7, 8
  LDI r6, 0
  LDI r12, 3164
  LDI r8, 4
  LINE r15, r7, r6, r12, r8
  CALL func_1
func_1:
  OR r8, r3, r1
  AND r10, r15, r14
  RET
  MOD r15, r9, r11
  HALT
