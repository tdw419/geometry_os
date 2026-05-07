; subroutine calls
; initialization
  LDI r12, 0x413F1B
  LDI r29, 128
  CALL func_0
func_0:
  SUB r0, r8, r12
  SUB r2, r8, r6
  AND r11, r12, r15
  SHL r12, r1, r14
  DIV r14, r3, r11
  RET
  CALL func_1
func_1:
  MUL r12, r14, r2
  DIV r2, r5, r0
  SHR r1, r5, r4
  MOD r6, r10, r12
  RET
  CALL func_2
func_2:
  OR r10, r6, r11
  XOR r9, r6, r31
  XOR r3, r2, r0
  RET
  HALT
