; subroutine calls
; initialization
  LDI r16, 3763
  LDI r31, 4043
  LDI r9, 0
  LDI r1, 0
  LDI r11, 128
  LDI r3, 1238
  LDI r15, 344
  LDI r8, 391
  CALL func_0
func_0:
  AND r8, r11, r5
  SHR r5, r14, r1
  SUB r8, r1, r14
  OR r11, r12, r9
  RET
  HALT
