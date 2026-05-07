; subroutine calls
; initialization
  LDI r16, 128
  LDI r2, 0xEB9808
  LDI r13, 0
  LDI r0, 1980
  LDI r11, 4057
  LDI r14, 2341
  CALL func_0
func_0:
  SUB r11, r27, r5
  MOD r13, r8, r7
  MOD r2, r15, r6
  SHL r7, r0, r6
  RET
  CALL func_1
func_1:
  ADD r31, r0, r3
  SHR r6, r2, r1
  SHL r0, r10, r14
  DIV r18, r6, r9
  ADD r7, r10, r12
  ADD r10, r30, r15
  RET
  CALL func_2
func_2:
  SHL r11, r2, r9
  MUL r26, r11, r6
  OR r11, r13, r15
  RET
  CALL func_3
func_3:
  ADD r5, r1, r9
  SUB r4, r2, r10
  SUB r6, r14, r13
  AND r4, r11, r15
  RET
  HALT
