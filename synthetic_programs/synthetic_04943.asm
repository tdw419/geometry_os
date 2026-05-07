; subroutine calls
; initialization
  LDI r5, 64
  LDI r3, 128
  LDI r11, 0
  LDI r0, 8
  LDI r7, 4090
  LDI r1, 757
  CALL func_0
func_0:
  DIV r15, r7, r11
  SUB r7, r14, r8
  RET
  CALL func_1
func_1:
  OR r6, r14, r11
  MOD r4, r1, r0
  OR r12, r10, r2
  OR r8, r6, r5
  RET
  CALL func_2
func_2:
  MOD r10, r27, r5
  ADD r24, r15, r5
  XOR r3, r4, r1
  SHL r4, r13, r11
  OR r15, r13, r7
  RET
  CALL func_3
func_3:
  SHL r3, r9, r7
  XOR r11, r9, r4
  RET
  HALT
