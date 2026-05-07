; subroutine calls
; initialization
  LDI r15, 1560
  LDI r11, 0xEA7CD3
  LDI r2, 3737
  LDI r1, 10
  LDI r3, 64
  LDI r13, 595
  LDI r9, 0x347EB0
  LDI r12, 0x68FD62
  CALL func_0
func_0:
  SHR r13, r6, r1
  SHR r13, r6, r9
  MOD r1, r14, r2
  SHR r1, r4, r3
  AND r13, r2, r14
  RET
  CALL func_1
func_1:
  ADD r1, r13, r15
  OR r3, r5, r10
  XOR r0, r12, r9
  SHR r14, r2, r0
  MUL r2, r10, r11
  RET
  CALL func_2
func_2:
  AND r4, r10, r17
  SUB r8, r6, r10
  SUB r1, r8, r4
  OR r10, r2, r0
  DIV r11, r6, r2
  RET
  CALL func_3
func_3:
  AND r2, r1, r3
  SUB r15, r3, r6
  MOD r5, r15, r3
  MOD r2, r5, r6
  SUB r12, r14, r6
  MOD r5, r3, r12
  RET
  HALT
