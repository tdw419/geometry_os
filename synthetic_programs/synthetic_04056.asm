; subroutine calls
; initialization
  LDI r5, 3666
  LDI r9, 10
  LDI r10, 255
  LDI r11, 0xF508A2
  CALL func_0
func_0:
  XOR r11, r6, r0
  XOR r3, r13, r15
  MUL r9, r5, r4
  MOD r13, r8, r14
  RET
  CALL func_1
func_1:
  SUB r15, r14, r9
  SUB r15, r12, r9
  MOD r15, r19, r5
  SHR r6, r12, r5
  SUB r13, r12, r20
  DIV r2, r4, r6
  RET
  CALL func_2
func_2:
  MOD r1, r15, r3
  ADD r9, r1, r13
  SHR r3, r0, r1
  XOR r11, r6, r7
  XOR r8, r0, r2
  RET
  CALL func_3
func_3:
  MUL r2, r14, r15
  SUB r13, r5, r0
  AND r14, r23, r0
  MUL r14, r2, r13
  RET
  HALT
