; subroutine calls
; initialization
  LDI r9, 0
  LDI r10, 32
  LDI r2, 0
  CALL func_0
func_0:
  MOD r2, r4, r5
  SUB r6, r9, r10
  RET
  HALT
