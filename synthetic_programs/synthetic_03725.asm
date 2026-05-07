; subroutine calls
; initialization
  LDI r1, 1278
  LDI r9, 128
  LDI r15, 0
  LDI r2, 0x8FB820
  LDI r7, 10
  LDI r3, 8
  LDI r11, 0xB3635F
  LDI r4, 16
  CALL func_0
func_0:
  AND r2, r8, r5
  DIV r6, r14, r12
  XOR r0, r4, r12
  AND r5, r0, r6
  SHR r3, r6, r1
  RET
  CALL func_1
func_1:
  DIV r14, r6, r10
  MOD r1, r14, r2
  SUB r3, r1, r6
  RET
  HALT
