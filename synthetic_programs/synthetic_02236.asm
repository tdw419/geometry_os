; subroutine calls
; initialization
  LDI r2, 0x413024
  LDI r0, 128
  LDI r14, 522
  CALL func_0
func_0:
  OR r12, r9, r26
  SHR r0, r4, r5
  RET
  CALL func_1
func_1:
  SUB r15, r23, r5
  SHL r2, r11, r14
  ADD r5, r17, r10
  RET
  CALL func_2
func_2:
  SHL r6, r29, r0
  MOD r3, r1, r0
  SHR r14, r13, r11
  XOR r3, r11, r6
  RET
  HALT
