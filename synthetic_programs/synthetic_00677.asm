; subroutine calls
; initialization
  LDI r9, 3364
  LDI r11, 0x314E48
  LDI r5, 1630
  LDI r0, 0x1C132E
  LDI r2, 4012
  LDI r14, 3122
  CALL func_0
func_0:
  AND r0, r14, r2
  MOD r7, r14, r6
  RET
  CALL func_1
func_1:
  SUB r11, r8, r15
  AND r10, r0, r4
  MUL r12, r4, r7
  OR r8, r6, r11
  RET
  HALT
