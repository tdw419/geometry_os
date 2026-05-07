; subroutine calls
; initialization
  LDI r9, 0xC5CC62
  LDI r1, 32
  LDI r7, 16
  LDI r6, 4070
  LDI r13, 1708
  LDI r2, 255
  CALL func_0
func_0:
  SHL r8, r9, r14
  MUL r7, r14, r11
  ADD r25, r1, r17
  MUL r8, r13, r9
  OR r2, r15, r6
  RET
  CALL func_1
func_1:
  DIV r8, r7, r5
  ADD r15, r12, r7
  SHL r5, r7, r12
  RET
  CALL func_2
func_2:
  MUL r6, r12, r13
  SHR r4, r13, r12
  SHR r10, r6, r12
  MUL r3, r11, r15
  XOR r8, r10, r13
  RET
  CALL func_3
func_3:
  AND r11, r13, r5
  MUL r8, r14, r4
  SHR r9, r6, r11
  SUB r14, r0, r10
  RET
  HALT
