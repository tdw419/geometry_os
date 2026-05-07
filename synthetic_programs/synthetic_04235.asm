; subroutine calls
; initialization
  LDI r3, 255
  LDI r5, 1605
  LDI r7, 3008
  LDI r0, 256
  LDI r10, 487
  LDI r14, 0x18D2DC
  LDI r2, 1323
  LDI r12, 128
  CALL func_0
func_0:
  DIV r2, r3, r8
  AND r9, r7, r28
  RET
  CALL func_1
func_1:
  AND r6, r5, r12
  XOR r5, r1, r31
  MOD r11, r1, r2
  OR r16, r13, r5
  SUB r1, r12, r15
  RET
  CALL func_2
func_2:
  SHR r0, r12, r4
  ADD r5, r1, r13
  ADD r12, r4, r15
  RET
  CALL func_3
func_3:
  MUL r9, r8, r7
  SHL r4, r13, r12
  OR r1, r15, r12
  OR r6, r5, r3
  MOD r3, r8, r12
  AND r11, r0, r9
  RET
  HALT
