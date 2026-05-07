; subroutine calls
; initialization
  LDI r2, 0xA76146
  LDI r7, 2735
  LDI r13, 128
  CALL func_0
func_0:
  ADD r6, r7, r13
  OR r5, r14, r0
  SUB r5, r7, r4
  SUB r9, r10, r1
  RET
  CALL func_1
func_1:
  XOR r5, r10, r7
  SHR r5, r7, r8
  ADD r2, r10, r4
  RET
  HALT
