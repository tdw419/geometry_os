; subroutine calls
; initialization
  LDI r6, 2460
  LDI r9, 1098
  LDI r4, 0x450F45
  LDI r2, 0x8B0176
  LDI r3, 768
  CALL func_0
func_0:
  MOD r9, r3, r15
  SUB r4, r9, r8
  RET
  HALT
