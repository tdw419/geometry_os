; subroutine calls
; initialization
  LDI r8, 0x8B0C89
  LDI r0, 0xCB6ADC
  LDI r7, 0
  LDI r5, 8
  LDI r11, 16
  LDI r10, 513
  CALL func_0
func_0:
  SHL r7, r1, r2
  MOD r5, r0, r10
  ADD r3, r11, r14
  SHR r12, r0, r8
  SHR r9, r0, r6
  RET
  CALL func_1
func_1:
  MOD r10, r4, r1
  OR r8, r2, r10
  SUB r14, r11, r13
  MOD r4, r17, r8
  SHR r3, r12, r7
  RET
  CALL func_2
func_2:
  DIV r5, r2, r6
  DIV r5, r1, r8
  SHR r5, r1, r7
  SHR r8, r11, r2
  ADD r9, r6, r2
  RET
  HALT
