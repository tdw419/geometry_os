; subroutine calls
; initialization
  LDI r1, 1246
  LDI r10, 128
  CALL func_0
func_0:
  OR r3, r6, r4
  MUL r1, r10, r11
  RET
  CALL func_1
func_1:
  SHR r6, r15, r5
  AND r7, r0, r2
  ADD r15, r6, r12
  RET
  HALT
