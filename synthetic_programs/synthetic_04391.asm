; subroutine calls
; initialization
  LDI r14, 10
  LDI r9, 128
  LDI r5, 3849
  CALL func_0
func_0:
  SUB r1, r5, r10
  XOR r6, r11, r8
  XOR r9, r10, r12
  RET
  CALL func_1
func_1:
  OR r3, r7, r4
  MUL r5, r15, r0
  RET
  CALL func_2
func_2:
  SHL r11, r2, r5
  XOR r4, r12, r8
  RET
  CALL func_3
func_3:
  SHL r2, r8, r1
  SHR r6, r4, r11
  XOR r2, r10, r5
  MOD r1, r12, r8
  DIV r2, r3, r1
  OR r6, r14, r1
  RET
  HALT
