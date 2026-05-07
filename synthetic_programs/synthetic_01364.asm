; subroutine calls
; initialization
  LDI r0, 16
  LDI r2, 0x26A499
  CALL func_0
func_0:
  MUL r13, r8, r1
  DIV r3, r7, r15
  SUB r12, r8, r7
  XOR r15, r12, r13
  OR r2, r14, r6
  SUB r1, r12, r15
  RET
  CALL func_1
func_1:
  XOR r7, r2, r6
  SHL r0, r15, r11
  MUL r13, r12, r3
  ADD r5, r14, r2
  RET
  CALL func_2
func_2:
  SUB r17, r13, r14
  AND r10, r5, r14
  MOD r18, r13, r11
  OR r14, r8, r31
  SHR r5, r7, r15
  RET
  HALT
