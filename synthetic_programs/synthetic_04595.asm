; subroutine calls
; initialization
  LDI r14, 0x9A6D97
  LDI r0, 0x20CCB5
  LDI r12, 3140
  LDI r11, 2
  CALL func_0
func_0:
  SHR r12, r1, r11
  ADD r3, r10, r5
  XOR r3, r0, r6
  RET
  CALL func_1
func_1:
  SHR r10, r4, r12
  SHR r13, r0, r12
  ADD r3, r15, r12
  SUB r4, r13, r2
  XOR r0, r16, r7
  RET
  CALL func_2
func_2:
  MOD r13, r5, r12
  MOD r6, r4, r2
  RET
  CALL func_3
func_3:
  MUL r6, r11, r1
  SHR r23, r11, r8
  SHL r12, r15, r7
  XOR r10, r1, r4
  SHL r15, r6, r14
  RET
  HALT
