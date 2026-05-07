; subroutine calls
; initialization
  LDI r12, 64
  LDI r3, 0xAE702D
  LDI r10, 16
  LDI r6, 3727
  LDI r1, 0x1088DE
  LDI r15, 3816
  LDI r11, 2
  CALL func_0
func_0:
  DIV r10, r13, r3
  SHR r3, r5, r10
  MOD r26, r13, r6
  XOR r6, r8, r0
  XOR r11, r12, r9
  XOR r10, r12, r14
  RET
  CALL func_1
func_1:
  MOD r0, r4, r2
  ADD r7, r14, r12
  SHR r10, r12, r13
  XOR r9, r15, r12
  MOD r12, r5, r7
  RET
  CALL func_2
func_2:
  XOR r13, r4, r15
  MOD r9, r15, r1
  SHL r15, r9, r7
  SHL r1, r15, r7
  MUL r4, r10, r16
  MUL r6, r2, r1
  RET
  CALL func_3
func_3:
  SHL r13, r3, r2
  SUB r11, r14, r15
  ADD r7, r15, r10
  RET
  HALT
