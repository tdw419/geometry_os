; subroutine calls
; initialization
  LDI r14, 255
  LDI r8, 0x5DFDE2
  LDI r11, 0xF521AE
  LDI r24, 128
  CALL func_0
func_0:
  AND r9, r15, r2
  DIV r16, r1, r0
  AND r14, r23, r11
  RET
  CALL func_1
func_1:
  AND r6, r8, r5
  OR r2, r8, r3
  RET
  CALL func_2
func_2:
  SHR r10, r8, r2
  OR r4, r14, r1
  ADD r4, r14, r10
  MOD r1, r11, r14
  RET
  HALT
