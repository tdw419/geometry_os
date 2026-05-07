; subroutine calls
; initialization
  LDI r2, 255
  LDI r10, 625
  LDI r8, 3252
  LDI r5, 64
  LDI r15, 10
  CALL func_0
func_0:
  XOR r15, r18, r13
  OR r12, r3, r14
  MOD r15, r5, r14
  OR r9, r14, r1
  OR r10, r6, r11
  RET
  CALL func_1
func_1:
  MOD r7, r14, r9
  SUB r18, r10, r4
  AND r2, r11, r12
  MUL r2, r11, r4
  ADD r10, r7, r13
  RET
  HALT
