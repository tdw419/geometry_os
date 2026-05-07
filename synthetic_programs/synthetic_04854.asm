; subroutine calls
; initialization
  LDI r11, 16
  LDI r7, 2
  LDI r13, 1391
  LDI r4, 0x139B0F
  LDI r5, 0x3EBE6D
  CALL func_0
func_0:
  XOR r2, r10, r6
  MUL r0, r12, r13
  RET
  CALL func_1
func_1:
  SUB r14, r8, r4
  DIV r14, r4, r5
  XOR r13, r5, r1
  SHR r12, r1, r13
  MOD r8, r14, r7
  RET
  CALL func_2
func_2:
  XOR r9, r5, r11
  MOD r14, r9, r13
  ADD r3, r10, r1
  SHR r12, r26, r8
  XOR r0, r11, r6
  MOD r4, r8, r14
  RET
  CALL func_3
func_3:
  MOD r5, r12, r8
  SHR r0, r13, r4
  SUB r16, r15, r3
  OR r7, r15, r3
  AND r11, r13, r4
  RET
  HALT
