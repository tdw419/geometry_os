; subroutine calls
; initialization
  LDI r29, 2
  LDI r13, 0
  LDI r12, 0xB03B7D
  CALL func_0
func_0:
  MOD r15, r27, r0
  MOD r8, r5, r10
  OR r3, r6, r4
  SUB r12, r10, r9
  ADD r10, r12, r14
  OR r17, r4, r5
  RET
  CALL func_1
func_1:
  MOD r12, r14, r2
  SHR r21, r1, r14
  ADD r13, r2, r1
  AND r30, r22, r8
  MUL r20, r15, r11
  OR r7, r0, r31
  RET
  CALL func_2
func_2:
  SHR r0, r7, r13
  SUB r14, r5, r10
  MUL r9, r4, r7
  XOR r12, r3, r15
  OR r6, r4, r9
  MUL r1, r15, r6
  RET
  HALT
