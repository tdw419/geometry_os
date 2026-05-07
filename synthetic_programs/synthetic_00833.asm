; subroutine calls
; initialization
  LDI r1, 0x999260
  LDI r14, 0x5E3605
  LDI r13, 0x8F13D1
  LDI r15, 3090
  CALL func_0
func_0:
  SHR r6, r13, r9
  SUB r9, r21, r14
  SHR r7, r6, r0
  MUL r8, r1, r6
  AND r9, r14, r8
  RET
  CALL func_1
func_1:
  AND r6, r12, r11
  SHL r6, r3, r8
  MUL r1, r10, r2
  SUB r7, r5, r26
  SHL r1, r12, r15
  MUL r4, r14, r8
  RET
  CALL func_2
func_2:
  ADD r11, r3, r4
  ADD r6, r0, r8
  RET
  HALT
