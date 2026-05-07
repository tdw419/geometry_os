; subroutine calls
; initialization
  LDI r1, 61
  LDI r7, 4
  LDI r6, 16
  CALL func_0
func_0:
  SUB r3, r7, r6
  ADD r1, r3, r12
  OR r8, r9, r28
  DIV r15, r10, r6
  SHR r0, r6, r4
  RET
  CALL func_1
func_1:
  AND r11, r10, r3
  SUB r25, r11, r2
  RET
  CALL func_2
func_2:
  SUB r0, r3, r9
  DIV r6, r1, r13
  SHR r13, r14, r2
  AND r9, r8, r6
  MUL r13, r5, r14
  RET
  HALT
