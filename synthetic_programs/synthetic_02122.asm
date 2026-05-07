; subroutine calls
; initialization
  LDI r4, 2
  LDI r14, 0xAA9D6F
  LDI r11, 10
  LDI r6, 16
  LDI r7, 0x4D861F
  LDI r25, 3220
  LDI r2, 0x7A036B
  CALL func_0
func_0:
  SUB r5, r10, r22
  OR r13, r5, r9
  AND r10, r5, r1
  OR r4, r2, r7
  SUB r11, r4, r21
  RET
  CALL func_1
func_1:
  SHR r8, r13, r3
  ADD r26, r11, r5
  MOD r7, r0, r2
  RET
  CALL func_2
func_2:
  SHL r1, r14, r2
  DIV r1, r9, r10
  MOD r4, r7, r2
  SHL r9, r11, r13
  MOD r15, r3, r10
  RET
  HALT
