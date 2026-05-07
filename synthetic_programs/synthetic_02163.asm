; subroutine calls
; initialization
  LDI r12, 255
  LDI r6, 1512
  LDI r9, 2303
  LDI r11, 1
  LDI r3, 4020
  LDI r2, 255
  LDI r14, 2605
  CALL func_0
func_0:
  SUB r24, r3, r12
  XOR r11, r9, r7
  MUL r15, r24, r5
  RET
  HALT
