; subroutine calls
; initialization
  LDI r8, 255
  LDI r5, 16
  CALL func_0
func_0:
  ADD r4, r8, r1
  MUL r9, r3, r13
  XOR r19, r2, r5
  RET
  CALL func_1
func_1:
  MOD r6, r9, r13
  SHL r6, r13, r7
  SHR r9, r2, r13
  ADD r7, r0, r2
  RET
  HALT
