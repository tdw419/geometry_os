; subroutine calls
; initialization
  LDI r2, 10
  LDI r17, 256
  LDI r5, 3943
  LDI r30, 3542
  LDI r4, 990
  LDI r26, 1620
  CALL func_0
func_0:
  DIV r7, r13, r27
  OR r7, r6, r15
  RET
  CALL func_1
func_1:
  SHL r2, r12, r6
  MUL r9, r20, r13
  MUL r15, r7, r21
  ADD r8, r0, r13
  RET
  CALL func_2
func_2:
  SUB r5, r12, r14
  SHR r5, r9, r7
  SHR r13, r23, r0
  MOD r12, r6, r0
  RET
  CALL func_3
func_3:
  MUL r8, r2, r11
  XOR r6, r3, r11
  SUB r2, r5, r7
  ADD r2, r19, r15
  XOR r3, r6, r11
  RET
  HALT
