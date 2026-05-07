; subroutine calls
; initialization
  LDI r11, 0x17EF24
  LDI r0, 0xBE699C
  LDI r1, 16
  LDI r13, 2
  LDI r9, 0xB29F1D
  LDI r14, 16
  CALL func_0
func_0:
  AND r2, r12, r9
  SHL r12, r4, r6
  MOD r6, r1, r2
  ADD r4, r14, r11
  RET
  CALL func_1
func_1:
  XOR r8, r12, r4
  OR r9, r15, r3
  SUB r10, r4, r8
  MOD r6, r4, r15
  DIV r7, r18, r5
  OR r6, r2, r3
  RET
  CALL func_2
func_2:
  XOR r10, r14, r0
  AND r7, r8, r1
  XOR r15, r14, r4
  RET
  HALT
