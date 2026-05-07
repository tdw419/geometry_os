; subroutine calls
; initialization
  LDI r10, 1437
  LDI r1, 640
  LDI r8, 0xFBDEDD
  LDI r6, 32
  LDI r12, 0x22B948
  CALL func_0
func_0:
  OR r5, r9, r0
  MUL r1, r8, r4
  ADD r1, r17, r14
  RET
  CALL func_1
func_1:
  SUB r6, r14, r4
  MOD r9, r2, r8
  SHL r3, r7, r8
  SUB r7, r5, r6
  SHR r10, r14, r11
  RET
  CALL func_2
func_2:
  DIV r5, r0, r9
  SHL r6, r8, r9
  MUL r8, r13, r15
  MOD r9, r6, r0
  AND r5, r10, r6
  RET
  CALL func_3
func_3:
  SHL r4, r5, r27
  MOD r15, r11, r5
  SHR r6, r7, r11
  XOR r5, r14, r3
  MOD r30, r15, r3
  RET
  HALT
