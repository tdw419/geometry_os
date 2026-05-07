; subroutine calls
; initialization
  LDI r13, 0x7D2CAB
  LDI r11, 8
  LDI r15, 0xAC664A
  LDI r12, 0xAF65A8
  LDI r7, 0xC36B71
  LDI r19, 2384
  CALL func_0
func_0:
  MOD r14, r5, r11
  XOR r5, r0, r9
  MOD r15, r7, r10
  MUL r13, r14, r4
  AND r0, r6, r11
  RET
  CALL func_1
func_1:
  XOR r26, r14, r0
  MOD r10, r6, r11
  MOD r7, r1, r2
  XOR r0, r13, r1
  MOD r5, r0, r3
  MOD r12, r20, r10
  RET
  HALT
