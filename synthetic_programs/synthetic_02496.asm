; subroutine calls
; initialization
  LDI r20, 10
  LDI r4, 64
  LDI r6, 0xA5659D
  LDI r2, 2609
  LDI r13, 4
  LDI r5, 10
  LDI r3, 1
  CALL func_0
func_0:
  DIV r0, r6, r15
  SHR r3, r5, r4
  ADD r13, r4, r1
  RET
  CALL func_1
func_1:
  SHL r14, r5, r12
  SUB r3, r2, r4
  MUL r1, r10, r11
  RET
  CALL func_2
func_2:
  XOR r3, r2, r5
  XOR r4, r21, r0
  ADD r6, r13, r3
  SHR r11, r4, r1
  RET
  CALL func_3
func_3:
  OR r11, r2, r7
  SUB r0, r1, r2
  MUL r12, r15, r14
  AND r11, r0, r3
  RET
  HALT
