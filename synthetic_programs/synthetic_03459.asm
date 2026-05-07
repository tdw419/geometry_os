; subroutine calls
; initialization
  LDI r6, 2680
  LDI r11, 0xFED5A6
  LDI r7, 128
  LDI r4, 0x2FE40E
  LDI r15, 255
  LDI r13, 2
  LDI r14, 0x3B0878
  LDI r2, 10
  CALL func_0
func_0:
  XOR r6, r13, r0
  AND r3, r2, r9
  MOD r5, r13, r6
  SHL r10, r13, r15
  RET
  CALL func_1
func_1:
  AND r6, r15, r2
  DIV r7, r12, r4
  MOD r10, r5, r0
  SHR r9, r4, r12
  SHL r4, r12, r21
  RET
  CALL func_2
func_2:
  DIV r13, r15, r6
  ADD r1, r15, r4
  RET
  CALL func_3
func_3:
  XOR r14, r11, r10
  SHR r9, r10, r0
  RET
  HALT
