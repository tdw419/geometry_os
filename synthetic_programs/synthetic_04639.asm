; subroutine calls
; initialization
  LDI r9, 16
  LDI r11, 0x2943BA
  CALL func_0
func_0:
  ADD r12, r11, r2
  SUB r11, r12, r1
  OR r0, r6, r5
  MOD r7, r3, r0
  DIV r4, r7, r0
  AND r10, r5, r0
  RET
  CALL func_1
func_1:
  DIV r10, r11, r5
  MOD r10, r12, r15
  RET
  CALL func_2
func_2:
  MUL r6, r26, r10
  SUB r1, r10, r2
  RET
  CALL func_3
func_3:
  OR r8, r15, r14
  MUL r5, r14, r3
  RET
  HALT
