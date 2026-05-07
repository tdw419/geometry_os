; subroutine calls
; initialization
  LDI r12, 8
  LDI r9, 0
  LDI r4, 2734
  LDI r15, 0x564007
  LDI r10, 1942
  LDI r3, 34
  LDI r5, 0x1A5EB0
  CALL func_0
func_0:
  SHL r7, r11, r28
  DIV r2, r4, r6
  RET
  CALL func_1
func_1:
  XOR r9, r12, r1
  ADD r11, r6, r0
  AND r4, r12, r9
  ADD r14, r11, r0
  SHL r12, r10, r1
  SHR r12, r15, r4
  RET
  CALL func_2
func_2:
  DIV r5, r7, r12
  DIV r3, r13, r15
  SUB r7, r2, r4
  RET
  CALL func_3
func_3:
  MUL r3, r4, r13
  SUB r4, r10, r7
  RET
  HALT
