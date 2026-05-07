; subroutine calls
; initialization
  LDI r11, 2072
  LDI r9, 0
  LDI r8, 255
  LDI r1, 678
  LDI r6, 3708
  CALL func_0
func_0:
  MUL r14, r6, r12
  SHL r15, r3, r9
  OR r8, r1, r11
  SUB r8, r3, r5
  OR r2, r14, r1
  RET
  CALL func_1
func_1:
  XOR r7, r29, r10
  SHR r12, r8, r1
  RET
  CALL func_2
func_2:
  OR r0, r12, r5
  MOD r13, r1, r9
  AND r4, r13, r9
  SUB r31, r28, r5
  SHR r9, r30, r12
  RET
  HALT
