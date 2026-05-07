; subroutine calls
; initialization
  LDI r10, 0x67475D
  LDI r15, 2
  LDI r13, 0x42FD97
  LDI r5, 0x1E7D70
  CALL func_0
func_0:
  ADD r7, r13, r15
  OR r14, r5, r11
  XOR r6, r1, r2
  RET
  CALL func_1
func_1:
  SUB r12, r7, r11
  MOD r9, r13, r5
  ADD r6, r15, r1
  MUL r2, r7, r15
  SHR r14, r13, r11
  RET
  CALL func_2
func_2:
  MOD r1, r3, r8
  DIV r3, r1, r6
  XOR r6, r1, r4
  DIV r6, r2, r10
  RET
  HALT
