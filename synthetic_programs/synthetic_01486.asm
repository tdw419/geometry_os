; subroutine calls
; initialization
  LDI r11, 255
  LDI r3, 0xC8EE7F
  CALL func_0
func_0:
  SUB r9, r14, r0
  XOR r9, r7, r25
  ADD r24, r0, r2
  OR r12, r14, r10
  XOR r21, r11, r7
  DIV r10, r5, r2
  RET
  CALL func_1
func_1:
  AND r0, r2, r14
  MOD r5, r9, r3
  XOR r9, r15, r2
  XOR r2, r11, r0
  DIV r13, r14, r12
  RET
  HALT
