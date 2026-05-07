; subroutine calls
; initialization
  LDI r10, 0x47D013
  LDI r12, 10
  LDI r20, 256
  LDI r4, 0x1B1491
  LDI r7, 32
  LDI r11, 10
  CALL func_0
func_0:
  MUL r15, r8, r7
  SHL r3, r15, r8
  SHL r25, r2, r5
  OR r0, r2, r12
  DIV r0, r5, r2
  MUL r7, r10, r3
  RET
  CALL func_1
func_1:
  SHL r5, r7, r20
  XOR r15, r7, r10
  MOD r11, r9, r5
  RET
  HALT
