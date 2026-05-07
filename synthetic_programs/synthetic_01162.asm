; subroutine calls
; initialization
  LDI r13, 1
  LDI r2, 4
  LDI r11, 897
  CALL func_0
func_0:
  SUB r1, r11, r8
  AND r10, r9, r1
  MOD r2, r17, r14
  RET
  CALL func_1
func_1:
  OR r0, r21, r13
  OR r9, r14, r10
  RET
  CALL func_2
func_2:
  SUB r0, r10, r6
  SUB r5, r7, r11
  MUL r2, r11, r7
  ADD r13, r9, r6
  MOD r14, r8, r12
  ADD r11, r17, r7
  RET
  CALL func_3
func_3:
  DIV r14, r3, r12
  XOR r7, r25, r6
  XOR r27, r5, r14
  SHR r7, r10, r2
  MUL r0, r11, r14
  OR r2, r25, r10
  RET
  HALT
