; subroutine calls
; initialization
  LDI r10, 0xF6A87D
  LDI r2, 1
  LDI r4, 1667
  LDI r6, 3931
  LDI r7, 0x10BED0
  LDI r12, 4
  CALL func_0
func_0:
  ADD r9, r0, r7
  MOD r9, r8, r6
  AND r13, r3, r8
  OR r13, r1, r0
  RET
  HALT
