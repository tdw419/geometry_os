; subroutine calls
; initialization
  LDI r5, 0
  LDI r14, 2049
  LDI r0, 0x77644B
  LDI r4, 0x328884
  CALL func_0
func_0:
  AND r7, r6, r12
  OR r29, r5, r4
  ADD r4, r9, r28
  RET
  CALL func_1
func_1:
  SHR r7, r5, r9
  SUB r1, r8, r13
  SUB r13, r6, r5
  ADD r10, r3, r7
  MOD r11, r1, r10
  RET
  HALT
