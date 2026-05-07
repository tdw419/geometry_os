; subroutine calls
; initialization
  LDI r9, 3539
  LDI r13, 32
  LDI r16, 254
  LDI r4, 0x0AD8EC
  CALL func_0
func_0:
  SHR r3, r9, r11
  MUL r2, r10, r9
  ADD r4, r2, r11
  AND r26, r11, r15
  RET
  CALL func_1
func_1:
  AND r6, r4, r14
  OR r12, r14, r13
  MOD r13, r8, r14
  RET
  CALL func_2
func_2:
  OR r2, r3, r13
  MUL r1, r4, r15
  RET
  CALL func_3
func_3:
  OR r6, r14, r13
  AND r0, r10, r3
  DIV r9, r13, r0
  AND r1, r24, r3
  DIV r2, r13, r10
  DIV r15, r10, r11
  RET
  HALT
