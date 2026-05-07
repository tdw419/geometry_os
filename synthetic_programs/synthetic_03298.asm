; subroutine calls
; initialization
  LDI r8, 1
  LDI r5, 114
  LDI r13, 0x7B56A7
  CALL func_0
func_0:
  MUL r0, r8, r10
  MOD r1, r14, r6
  SUB r0, r9, r13
  SHL r5, r6, r4
  DIV r3, r7, r14
  AND r7, r14, r0
  RET
  CALL func_1
func_1:
  DIV r13, r3, r2
  SUB r11, r14, r3
  RET
  CALL func_2
func_2:
  OR r5, r8, r17
  AND r7, r6, r11
  SHR r14, r11, r9
  RET
  CALL func_3
func_3:
  OR r10, r6, r8
  OR r7, r6, r4
  DIV r13, r31, r12
  RET
  HALT
