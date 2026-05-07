; subroutine calls
; initialization
  LDI r0, 0xE4361F
  LDI r3, 911
  LDI r8, 193
  CALL func_0
func_0:
  XOR r5, r11, r4
  SHR r26, r3, r15
  RET
  CALL func_1
func_1:
  AND r9, r3, r2
  ADD r9, r7, r4
  SHL r14, r22, r9
  SUB r0, r4, r8
  OR r7, r14, r3
  RET
  CALL func_2
func_2:
  DIV r9, r1, r12
  SHL r9, r0, r15
  OR r12, r15, r5
  OR r15, r3, r9
  RET
  HALT
