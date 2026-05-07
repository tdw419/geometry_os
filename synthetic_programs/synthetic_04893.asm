; subroutine calls
; initialization
  LDI r10, 32
  LDI r1, 3296
  LDI r12, 10
  LDI r2, 32
  LDI r13, 0xAD94C9
  LDI r14, 10
  LDI r9, 0
  CALL func_0
func_0:
  XOR r4, r14, r12
  ADD r6, r4, r11
  MUL r2, r14, r13
  OR r13, r30, r0
  SHR r1, r3, r6
  RET
  CALL func_1
func_1:
  XOR r25, r15, r31
  AND r15, r8, r10
  OR r7, r15, r4
  MOD r11, r10, r6
  OR r1, r3, r4
  RET
  HALT
