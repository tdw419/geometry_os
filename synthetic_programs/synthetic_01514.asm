; subroutine calls
; initialization
  LDI r1, 0x967D1B
  LDI r13, 32
  LDI r11, 0xC604A1
  CALL func_0
func_0:
  SUB r13, r23, r3
  AND r9, r27, r12
  ADD r15, r13, r7
  XOR r2, r14, r22
  MUL r15, r4, r7
  RET
  CALL func_1
func_1:
  MUL r6, r1, r7
  MUL r1, r8, r4
  XOR r15, r14, r23
  OR r12, r6, r10
  ADD r13, r11, r1
  MUL r13, r0, r2
  RET
  CALL func_2
func_2:
  DIV r18, r5, r0
  MUL r8, r13, r5
  ADD r13, r15, r11
  AND r14, r8, r9
  RET
  CALL func_3
func_3:
  ADD r2, r4, r5
  OR r6, r15, r11
  MOD r13, r0, r15
  SUB r12, r13, r6
  XOR r2, r4, r31
  RET
  HALT
