; subroutine calls
; initialization
  LDI r15, 16
  LDI r1, 2142
  LDI r2, 0xCB2B9D
  LDI r9, 255
  LDI r8, 0xDC4F76
  LDI r7, 2601
  CALL func_0
func_0:
  SUB r9, r7, r11
  MOD r9, r5, r6
  SHL r5, r11, r4
  RET
  CALL func_1
func_1:
  XOR r9, r6, r8
  OR r5, r18, r25
  XOR r9, r15, r8
  OR r8, r2, r0
  RET
  CALL func_2
func_2:
  SUB r11, r5, r13
  SUB r13, r15, r11
  SHL r11, r13, r14
  SHR r10, r14, r3
  XOR r3, r14, r5
  RET
  CALL func_3
func_3:
  XOR r8, r14, r2
  MOD r5, r28, r3
  ADD r8, r4, r14
  XOR r19, r14, r10
  SHR r10, r14, r13
  RET
  HALT
