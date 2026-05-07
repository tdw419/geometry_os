; subroutine calls
; initialization
  LDI r12, 0xADB345
  LDI r14, 4
  LDI r15, 0xB9B6AE
  LDI r9, 0x2624DC
  LDI r2, 0xE3EE79
  LDI r4, 3759
  LDI r19, 407
  LDI r1, 637
  CALL func_0
func_0:
  AND r6, r4, r1
  MOD r6, r2, r4
  ADD r7, r3, r6
  AND r4, r6, r5
  DIV r0, r7, r21
  SUB r1, r8, r2
  RET
  CALL func_1
func_1:
  AND r2, r7, r4
  SHR r7, r11, r10
  RET
  CALL func_2
func_2:
  XOR r4, r14, r11
  SHR r4, r0, r12
  MOD r22, r5, r0
  XOR r12, r6, r0
  RET
  CALL func_3
func_3:
  SHR r6, r9, r11
  SHR r5, r13, r10
  DIV r11, r8, r4
  OR r14, r5, r2
  SUB r12, r9, r0
  RET
  HALT
