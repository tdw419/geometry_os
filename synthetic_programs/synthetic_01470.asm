; subroutine calls
; initialization
  LDI r19, 0x0D109E
  LDI r2, 255
  CALL func_0
func_0:
  MOD r3, r1, r12
  AND r11, r8, r7
  XOR r2, r5, r13
  MUL r10, r13, r3
  DIV r4, r13, r5
  XOR r5, r14, r8
  RET
  CALL func_1
func_1:
  MUL r8, r6, r0
  MOD r1, r14, r12
  MUL r6, r9, r17
  RET
  CALL func_2
func_2:
  DIV r6, r1, r2
  MUL r1, r6, r13
  AND r1, r5, r4
  SUB r8, r0, r9
  ADD r11, r1, r6
  RET
  CALL func_3
func_3:
  SHR r12, r10, r8
  SUB r11, r10, r4
  SUB r0, r11, r13
  SHL r3, r4, r7
  RET
  HALT
