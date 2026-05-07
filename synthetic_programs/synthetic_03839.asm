; subroutine calls
; initialization
  LDI r2, 32
  LDI r4, 2016
  CALL func_0
func_0:
  SHL r7, r2, r11
  MOD r6, r4, r14
  RET
  CALL func_1
func_1:
  SUB r10, r5, r6
  SHR r12, r10, r8
  DIV r15, r7, r3
  RET
  CALL func_2
func_2:
  XOR r12, r0, r9
  SHL r13, r12, r9
  XOR r12, r13, r15
  MOD r3, r0, r11
  RET
  CALL func_3
func_3:
  ADD r15, r8, r29
  SUB r9, r18, r7
  SUB r8, r5, r10
  RET
  HALT
