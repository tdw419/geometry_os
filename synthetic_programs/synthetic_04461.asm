; subroutine calls
; initialization
  LDI r4, 32
  LDI r5, 0x1E2AA8
  LDI r9, 128
  CALL func_0
func_0:
  XOR r13, r2, r12
  MOD r11, r15, r6
  OR r15, r12, r1
  AND r11, r10, r5
  RET
  CALL func_1
func_1:
  SHR r10, r6, r5
  SUB r10, r13, r1
  XOR r7, r3, r5
  DIV r21, r9, r4
  SHL r5, r13, r8
  RET
  CALL func_2
func_2:
  OR r8, r6, r5
  OR r7, r9, r1
  AND r1, r7, r3
  AND r4, r7, r31
  SHL r15, r12, r5
  RET
  HALT
