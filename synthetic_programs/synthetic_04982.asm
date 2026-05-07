; subroutine calls
; initialization
  LDI r0, 3651
  LDI r8, 0x02AA43
  LDI r1, 0x53F822
  LDI r2, 256
  LDI r13, 0x1D877E
  LDI r11, 256
  LDI r15, 10
  CALL func_0
func_0:
  SUB r14, r8, r6
  DIV r1, r11, r7
  RET
  CALL func_1
func_1:
  OR r0, r11, r10
  ADD r7, r1, r15
  ADD r13, r2, r0
  SHR r22, r1, r2
  OR r13, r9, r14
  AND r9, r17, r13
  RET
  HALT
