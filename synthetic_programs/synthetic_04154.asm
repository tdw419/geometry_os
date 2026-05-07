; subroutine calls
; initialization
  LDI r11, 0xF046C9
  LDI r14, 44
  LDI r7, 64
  LDI r2, 0
  LDI r6, 0x91DB36
  LDI r1, 0x5F8B75
  CALL func_0
func_0:
  MOD r6, r8, r14
  XOR r1, r4, r5
  ADD r1, r9, r10
  SHR r7, r5, r4
  SHL r3, r19, r4
  OR r4, r14, r0
  RET
  CALL func_1
func_1:
  MUL r12, r15, r8
  SHL r8, r6, r16
  SHL r12, r8, r22
  RET
  CALL func_2
func_2:
  XOR r15, r11, r8
  AND r9, r4, r12
  RET
  CALL func_3
func_3:
  DIV r15, r8, r14
  SHR r2, r15, r12
  MUL r14, r9, r13
  SHL r15, r0, r12
  RET
  HALT
