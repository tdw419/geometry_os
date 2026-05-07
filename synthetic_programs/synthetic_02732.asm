; subroutine calls
; initialization
  LDI r3, 0x3077E5
  LDI r0, 3508
  CALL func_0
func_0:
  XOR r12, r16, r5
  SUB r8, r11, r3
  DIV r4, r2, r1
  SUB r9, r3, r7
  RET
  CALL func_1
func_1:
  SHL r5, r13, r9
  MOD r9, r10, r2
  OR r14, r10, r3
  AND r1, r3, r12
  AND r0, r14, r10
  SHL r7, r11, r12
  RET
  HALT
