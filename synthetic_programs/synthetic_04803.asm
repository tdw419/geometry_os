; subroutine calls
; initialization
  LDI r1, 0x637CA2
  LDI r9, 64
  CALL func_0
func_0:
  AND r10, r11, r0
  MOD r4, r0, r31
  SUB r13, r3, r15
  RET
  CALL func_1
func_1:
  SHR r4, r1, r13
  DIV r6, r1, r16
  RET
  CALL func_2
func_2:
  MOD r3, r11, r6
  SHL r8, r7, r11
  AND r8, r2, r13
  RET
  HALT
