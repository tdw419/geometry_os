; subroutine calls
; initialization
  LDI r6, 0xE2A019
  LDI r9, 1943
  LDI r0, 0x132057
  LDI r5, 0x9AAE4C
  CALL func_0
func_0:
  SUB r10, r2, r4
  ADD r8, r14, r10
  MOD r13, r5, r1
  MUL r14, r4, r13
  RET
  CALL func_1
func_1:
  ADD r1, r15, r0
  DIV r11, r5, r19
  DIV r9, r13, r5
  MUL r5, r3, r15
  RET
  CALL func_2
func_2:
  SHL r10, r3, r0
  DIV r15, r14, r2
  RET
  CALL func_3
func_3:
  ADD r12, r9, r0
  DIV r15, r5, r8
  SUB r8, r13, r7
  RET
  HALT
