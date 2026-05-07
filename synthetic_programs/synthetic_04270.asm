; subroutine calls
; initialization
  LDI r9, 4
  LDI r12, 0xD9EFCC
  LDI r13, 0
  LDI r11, 32
  CALL func_0
func_0:
  MUL r6, r7, r0
  SHL r7, r6, r29
  SHL r3, r13, r1
  MOD r1, r10, r7
  RET
  HALT
