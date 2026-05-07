; subroutine calls
; initialization
  LDI r6, 0x31880F
  LDI r5, 3090
  LDI r2, 0xF4C724
  LDI r7, 0x9112FB
  CALL func_0
func_0:
  MUL r2, r11, r14
  OR r9, r13, r12
  OR r15, r7, r5
  SHL r21, r3, r14
  SHR r0, r3, r11
  MOD r4, r10, r12
  RET
  CALL func_1
func_1:
  XOR r13, r8, r0
  SHR r3, r2, r13
  SUB r2, r5, r11
  RET
  CALL func_2
func_2:
  AND r4, r1, r7
  SHR r9, r6, r0
  RET
  HALT
