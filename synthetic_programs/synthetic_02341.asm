; subroutine calls
; initialization
  LDI r11, 245
  LDI r10, 2009
  LDI r0, 0x582887
  LDI r13, 0x06C6F8
  LDI r15, 0x901A77
  LDI r9, 10
  LDI r14, 1
  LDI r12, 0xCD39F6
  CALL func_0
func_0:
  SHR r1, r12, r9
  OR r12, r3, r25
  RET
  CALL func_1
func_1:
  SHR r12, r0, r26
  DIV r29, r6, r24
  RET
  CALL func_2
func_2:
  SHL r2, r3, r8
  AND r6, r11, r0
  ADD r7, r6, r9
  ADD r12, r7, r4
  ADD r13, r0, r1
  AND r6, r12, r14
  RET
  CALL func_3
func_3:
  DIV r11, r5, r14
  DIV r10, r7, r13
  MOD r4, r14, r13
  RET
  HALT
