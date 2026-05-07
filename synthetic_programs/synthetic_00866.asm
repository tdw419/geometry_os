; subroutine calls
; initialization
  LDI r15, 0x8A365F
  LDI r11, 128
  LDI r5, 0x066F09
  LDI r1, 2276
  LDI r13, 64
  LDI r12, 2280
  CALL func_0
func_0:
  XOR r7, r14, r0
  MUL r4, r10, r7
  SUB r7, r4, r2
  SHL r6, r3, r13
  RET
  CALL func_1
func_1:
  SUB r10, r3, r8
  DIV r14, r12, r5
  MUL r11, r8, r9
  ADD r4, r12, r11
  SHL r31, r3, r8
  DIV r7, r10, r2
  RET
  CALL func_2
func_2:
  MUL r7, r13, r1
  OR r8, r7, r1
  DIV r12, r4, r0
  MUL r2, r5, r6
  AND r4, r7, r3
  RET
  HALT
