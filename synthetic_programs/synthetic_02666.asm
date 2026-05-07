; subroutine calls
; initialization
  LDI r10, 0
  LDI r3, 0x737E6D
  LDI r5, 128
  LDI r0, 0x466EBF
  CALL func_0
func_0:
  MUL r6, r9, r3
  AND r9, r10, r13
  SHL r13, r10, r19
  RET
  HALT
