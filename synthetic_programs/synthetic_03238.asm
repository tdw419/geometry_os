; subroutine calls
; initialization
  LDI r13, 0
  LDI r25, 16
  CALL func_0
func_0:
  DIV r6, r13, r11
  XOR r9, r2, r25
  DIV r5, r1, r13
  SHR r10, r11, r6
  MOD r11, r8, r2
  DIV r5, r12, r2
  RET
  CALL func_1
func_1:
  MUL r1, r12, r3
  MUL r14, r9, r17
  RET
  CALL func_2
func_2:
  OR r14, r6, r2
  DIV r4, r10, r9
  ADD r10, r0, r2
  MOD r14, r16, r1
  RET
  HALT
