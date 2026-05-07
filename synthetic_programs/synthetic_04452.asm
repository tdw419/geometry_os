; subroutine calls
; initialization
  LDI r11, 0
  LDI r19, 4
  LDI r12, 0x00C097
  LDI r9, 589
  LDI r3, 522
  LDI r15, 32
  CALL func_0
func_0:
  SHL r11, r8, r4
  AND r4, r7, r15
  RET
  CALL func_1
func_1:
  OR r14, r0, r11
  SHR r14, r5, r3
  AND r13, r2, r4
  MUL r15, r10, r2
  XOR r3, r9, r4
  RET
  HALT
