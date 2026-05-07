; subroutine calls
; initialization
  LDI r12, 128
  LDI r3, 16
  CALL func_0
func_0:
  OR r9, r4, r8
  ADD r10, r3, r7
  RET
  CALL func_1
func_1:
  MOD r13, r0, r10
  ADD r0, r15, r24
  RET
  CALL func_2
func_2:
  ADD r6, r4, r14
  ADD r9, r10, r6
  SHL r4, r10, r7
  SHL r4, r13, r1
  RET
  HALT
