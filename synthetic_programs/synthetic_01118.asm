; subroutine calls
; initialization
  LDI r13, 55
  LDI r5, 0x138A0A
  LDI r15, 16
  LDI r2, 128
  LDI r8, 2838
  LDI r1, 0xF0551D
  CALL func_0
func_0:
  SHR r13, r5, r10
  AND r5, r1, r20
  XOR r3, r2, r1
  AND r6, r10, r3
  SHL r14, r5, r1
  RET
  CALL func_1
func_1:
  SHL r5, r10, r2
  SHR r15, r9, r6
  SHL r14, r7, r11
  ADD r7, r4, r13
  MOD r3, r7, r11
  MUL r2, r3, r11
  RET
  CALL func_2
func_2:
  SHR r15, r10, r7
  OR r10, r9, r1
  MOD r13, r4, r10
  MUL r7, r4, r0
  DIV r11, r6, r2
  SHL r14, r8, r12
  RET
  HALT
