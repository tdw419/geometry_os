; subroutine calls
; initialization
  LDI r11, 0xF7AF8E
  LDI r8, 0x08D27E
  LDI r4, 1688
  LDI r0, 0xE34696
  LDI r20, 32
  LDI r10, 3437
  CALL func_0
func_0:
  OR r7, r5, r3
  ADD r14, r3, r13
  AND r6, r26, r15
  SHR r0, r10, r4
  MUL r15, r12, r13
  RET
  CALL func_1
func_1:
  SHL r15, r6, r13
  SHR r12, r2, r1
  MOD r1, r10, r12
  ADD r0, r8, r1
  SHL r10, r0, r7
  SHR r12, r10, r11
  RET
  CALL func_2
func_2:
  MUL r12, r7, r1
  ADD r5, r0, r2
  SHL r7, r14, r15
  OR r5, r6, r8
  RET
  CALL func_3
func_3:
  MUL r2, r5, r1
  MUL r15, r14, r19
  DIV r4, r13, r9
  AND r12, r10, r5
  RET
  HALT
