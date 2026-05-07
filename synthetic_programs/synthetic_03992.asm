; subroutine calls
; initialization
  LDI r15, 32
  LDI r4, 256
  LDI r13, 1578
  CALL func_0
func_0:
  MUL r14, r5, r6
  SHL r13, r10, r12
  DIV r1, r6, r0
  SHL r5, r4, r7
  RET
  CALL func_1
func_1:
  SHR r9, r11, r0
  AND r3, r4, r10
  RET
  CALL func_2
func_2:
  SHL r12, r29, r8
  MOD r13, r10, r4
  SHL r0, r10, r8
  RET
  CALL func_3
func_3:
  SHL r5, r8, r15
  SHR r13, r2, r9
  MOD r3, r17, r27
  SHL r11, r15, r10
  SHR r3, r12, r5
  SUB r15, r4, r1
  RET
  HALT
