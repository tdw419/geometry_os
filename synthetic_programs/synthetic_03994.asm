; subroutine calls
; initialization
  LDI r15, 0
  LDI r1, 1
  LDI r5, 0x11D58C
  LDI r13, 2353
  CALL func_0
func_0:
  MOD r9, r14, r0
  XOR r0, r15, r23
  MOD r2, r13, r14
  ADD r9, r10, r0
  MUL r13, r0, r15
  RET
  CALL func_1
func_1:
  SHL r4, r10, r15
  SHL r12, r2, r4
  RET
  CALL func_2
func_2:
  SHR r4, r13, r10
  SHL r12, r0, r16
  MOD r1, r4, r5
  ADD r7, r9, r11
  DIV r8, r0, r2
  RET
  HALT
