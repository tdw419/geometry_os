; subroutine calls
; initialization
  LDI r2, 2657
  LDI r4, 2416
  LDI r3, 1227
  LDI r0, 128
  LDI r12, 32
  LDI r9, 0x3EBBC0
  LDI r1, 0xDCC578
  CALL func_0
func_0:
  SHR r3, r6, r12
  DIV r13, r15, r0
  MOD r14, r5, r11
  SUB r14, r8, r9
  RET
  CALL func_1
func_1:
  AND r18, r11, r8
  MUL r2, r7, r4
  RET
  HALT
