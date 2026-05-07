; subroutine calls
; initialization
  LDI r12, 0xCA8189
  LDI r10, 0x570656
  LDI r11, 2599
  LDI r13, 0x64748F
  LDI r0, 256
  LDI r27, 1598
  CALL func_0
func_0:
  SHL r6, r14, r13
  XOR r2, r13, r5
  RET
  CALL func_1
func_1:
  SUB r0, r5, r12
  SHL r11, r9, r6
  SUB r0, r2, r12
  SUB r13, r4, r25
  RET
  CALL func_2
func_2:
  AND r15, r11, r7
  OR r12, r15, r4
  SHR r30, r5, r10
  RET
  CALL func_3
func_3:
  SUB r5, r7, r15
  SUB r2, r7, r8
  ADD r12, r0, r11
  OR r8, r4, r31
  RET
  HALT
