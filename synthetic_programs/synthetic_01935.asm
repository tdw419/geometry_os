; subroutine calls
; initialization
  LDI r9, 256
  LDI r13, 4
  LDI r2, 2887
  LDI r7, 255
  LDI r3, 3583
  LDI r4, 255
  CALL func_0
func_0:
  AND r1, r4, r13
  XOR r15, r0, r3
  SUB r14, r12, r13
  RET
  CALL func_1
func_1:
  AND r7, r1, r0
  MOD r4, r2, r6
  SUB r6, r9, r10
  RET
  HALT
