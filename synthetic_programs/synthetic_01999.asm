; subroutine calls
; initialization
  LDI r12, 255
  LDI r6, 0x7AF02C
  CALL func_0
func_0:
  SUB r6, r16, r24
  XOR r7, r13, r9
  DIV r10, r4, r0
  ADD r9, r1, r15
  RET
  CALL func_1
func_1:
  ADD r0, r14, r10
  SUB r3, r7, r8
  AND r4, r5, r7
  DIV r3, r9, r12
  MUL r29, r30, r14
  RET
  CALL func_2
func_2:
  MOD r6, r8, r12
  SHR r15, r11, r13
  MUL r13, r9, r0
  RET
  CALL func_3
func_3:
  AND r7, r13, r14
  DIV r0, r2, r6
  SUB r1, r10, r23
  ADD r13, r5, r7
  AND r13, r6, r9
  RET
  HALT
