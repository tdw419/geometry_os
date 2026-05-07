; subroutine calls
; initialization
  LDI r15, 1112
  LDI r1, 255
  LDI r17, 256
  CALL func_0
func_0:
  MUL r12, r14, r10
  AND r14, r12, r7
  MUL r13, r9, r1
  MOD r3, r15, r24
  OR r14, r6, r3
  RET
  HALT
