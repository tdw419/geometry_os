; subroutine calls
; initialization
  LDI r11, 0x1F742D
  LDI r9, 32
  LDI r3, 8
  CALL func_0
func_0:
  XOR r3, r10, r13
  ADD r0, r6, r7
  SHL r3, r13, r15
  ADD r14, r0, r8
  SHL r1, r14, r8
  SUB r15, r4, r7
  RET
  CALL func_1
func_1:
  ADD r9, r1, r15
  SHL r14, r19, r5
  SHR r5, r29, r14
  RET
  CALL func_2
func_2:
  SHL r12, r8, r0
  SHR r9, r14, r0
  MUL r4, r6, r13
  SHL r4, r10, r9
  RET
  HALT
