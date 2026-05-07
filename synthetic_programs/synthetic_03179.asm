; subroutine calls
; initialization
  LDI r9, 0x6F90D8
  LDI r0, 66
  LDI r13, 0
  LDI r8, 32
  LDI r7, 0
  CALL func_0
func_0:
  AND r4, r7, r12
  SHL r1, r0, r4
  RET
  CALL func_1
func_1:
  AND r12, r4, r6
  SUB r3, r4, r0
  SUB r0, r14, r7
  RET
  CALL func_2
func_2:
  AND r10, r15, r22
  SUB r3, r2, r15
  SHL r1, r9, r6
  SUB r9, r10, r3
  RET
  CALL func_3
func_3:
  ADD r8, r1, r4
  MOD r5, r11, r20
  MOD r5, r0, r2
  RET
  HALT
