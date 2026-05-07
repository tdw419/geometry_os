; subroutine calls
; initialization
  LDI r12, 675
  LDI r5, 517
  LDI r10, 0x17A29D
  LDI r29, 16
  CALL func_0
func_0:
  SHR r14, r13, r27
  XOR r4, r16, r8
  RET
  CALL func_1
func_1:
  DIV r12, r6, r15
  SUB r6, r9, r3
  DIV r13, r1, r2
  DIV r7, r9, r0
  RET
  CALL func_2
func_2:
  SHL r12, r4, r14
  MUL r1, r13, r18
  AND r2, r21, r27
  SUB r5, r0, r2
  SHL r1, r2, r14
  RET
  HALT
