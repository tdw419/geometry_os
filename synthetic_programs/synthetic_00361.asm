; subroutine calls
; initialization
  LDI r15, 0x453A32
  LDI r1, 0x0582F6
  LDI r12, 0xDF0539
  LDI r3, 2185
  LDI r14, 2494
  LDI r11, 698
  LDI r2, 2406
  CALL func_0
func_0:
  XOR r12, r5, r11
  SUB r6, r15, r12
  RET
  CALL func_1
func_1:
  OR r9, r0, r12
  SHL r7, r26, r8
  SUB r5, r14, r27
  SUB r23, r5, r9
  XOR r13, r2, r24
  RET
  CALL func_2
func_2:
  MUL r15, r10, r13
  OR r2, r14, r12
  MUL r6, r10, r2
  MOD r3, r6, r9
  OR r11, r2, r1
  ADD r10, r1, r0
  RET
  CALL func_3
func_3:
  MOD r14, r12, r5
  DIV r7, r6, r4
  MOD r14, r15, r12
  RET
  HALT
