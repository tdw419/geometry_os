; subroutine calls
; initialization
  LDI r1, 2376
  LDI r3, 0xA0BF60
  LDI r0, 0x16C8E0
  LDI r8, 64
  LDI r10, 10
  CALL func_0
func_0:
  OR r11, r16, r3
  OR r7, r10, r9
  AND r4, r7, r8
  SHL r3, r1, r6
  RET
  CALL func_1
func_1:
  XOR r4, r12, r10
  ADD r1, r2, r0
  AND r1, r5, r7
  SHR r9, r12, r14
  RET
  CALL func_2
func_2:
  AND r5, r10, r6
  DIV r14, r5, r8
  MOD r13, r24, r4
  OR r4, r1, r5
  RET
  CALL func_3
func_3:
  DIV r15, r2, r5
  MUL r5, r9, r1
  RET
  HALT
