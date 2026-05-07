; subroutine calls
; initialization
  LDI r6, 401
  LDI r8, 10
  LDI r13, 1384
  LDI r0, 2508
  LDI r15, 0x68E5E4
  LDI r2, 64
  CALL func_0
func_0:
  MOD r6, r0, r2
  DIV r9, r13, r8
  SUB r14, r3, r10
  RET
  HALT
