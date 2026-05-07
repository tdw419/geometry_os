; subroutine calls
; initialization
  LDI r30, 2393
  LDI r3, 64
  LDI r18, 159
  LDI r5, 10
  LDI r12, 0xE3F87F
  LDI r10, 10
  LDI r4, 2962
  CALL func_0
func_0:
  MOD r4, r6, r1
  DIV r10, r9, r3
  OR r7, r4, r3
  OR r0, r4, r14
  OR r9, r18, r8
  RET
  CALL func_1
func_1:
  SUB r13, r0, r7
  ADD r13, r0, r4
  SUB r11, r7, r0
  SUB r4, r16, r2
  XOR r9, r6, r10
  RET
  CALL func_2
func_2:
  DIV r5, r3, r0
  SHL r7, r25, r8
  RET
  CALL func_3
func_3:
  XOR r3, r4, r0
  SUB r10, r8, r2
  RET
  HALT
