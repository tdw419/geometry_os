; subroutine calls
; initialization
  LDI r14, 16
  LDI r10, 0
  LDI r7, 0x0F1FEC
  CALL func_0
func_0:
  MUL r12, r6, r15
  SUB r1, r13, r15
  SUB r15, r10, r2
  MUL r0, r2, r15
  OR r14, r11, r12
  RET
  CALL func_1
func_1:
  MUL r2, r4, r29
  ADD r13, r15, r1
  MOD r9, r4, r8
  MOD r4, r13, r8
  RET
  CALL func_2
func_2:
  MOD r1, r10, r2
  AND r10, r3, r15
  RET
  HALT
