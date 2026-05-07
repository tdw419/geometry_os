; subroutine calls
; initialization
  LDI r5, 0x072447
  LDI r1, 3212
  LDI r3, 48
  LDI r7, 0
  LDI r0, 0x83C6DC
  LDI r11, 3580
  LDI r8, 256
  LDI r4, 256
  CALL func_0
func_0:
  ADD r6, r13, r28
  MOD r2, r3, r8
  SHR r1, r0, r2
  SHR r4, r10, r3
  RET
  CALL func_1
func_1:
  SHR r7, r9, r29
  AND r13, r6, r12
  OR r6, r8, r4
  SHR r4, r0, r11
  AND r9, r5, r6
  RET
  CALL func_2
func_2:
  SUB r14, r10, r8
  DIV r8, r15, r13
  RET
  HALT
