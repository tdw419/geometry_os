; subroutine calls
; initialization
  LDI r7, 64
  LDI r1, 2880
  LDI r12, 2
  LDI r0, 417
  LDI r14, 0xD82542
  CALL func_0
func_0:
  SUB r14, r8, r15
  MOD r2, r3, r11
  DIV r3, r14, r9
  DIV r0, r1, r5
  XOR r11, r13, r12
  RET
  CALL func_1
func_1:
  ADD r3, r13, r9
  XOR r1, r0, r9
  RET
  CALL func_2
func_2:
  SUB r10, r20, r12
  MUL r10, r7, r8
  MUL r14, r9, r10
  RET
  HALT
