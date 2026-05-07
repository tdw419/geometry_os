; subroutine calls
; initialization
  LDI r11, 871
  LDI r14, 0x96748E
  LDI r7, 0x473A3F
  CALL func_0
func_0:
  OR r24, r13, r0
  ADD r14, r1, r8
  SUB r7, r5, r12
  MOD r6, r7, r4
  SHL r9, r22, r8
  SUB r3, r11, r15
  RET
  CALL func_1
func_1:
  MOD r3, r2, r4
  ADD r5, r10, r15
  SHL r3, r13, r6
  SHR r4, r18, r5
  SUB r0, r14, r3
  SHL r5, r14, r2
  RET
  CALL func_2
func_2:
  ADD r0, r6, r8
  MOD r0, r13, r9
  OR r9, r3, r7
  MOD r3, r10, r1
  SHL r13, r0, r4
  OR r9, r14, r10
  RET
  HALT
