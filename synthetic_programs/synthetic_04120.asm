; subroutine calls
; initialization
  LDI r9, 255
  LDI r3, 1702
  LDI r1, 0xA0F81E
  LDI r8, 2
  LDI r7, 2852
  CALL func_0
func_0:
  AND r14, r8, r5
  AND r12, r0, r9
  SHL r9, r7, r8
  SHR r0, r5, r1
  RET
  CALL func_1
func_1:
  SUB r10, r2, r0
  MOD r15, r9, r8
  RET
  HALT
