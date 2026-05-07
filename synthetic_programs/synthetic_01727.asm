; subroutine calls
; initialization
  LDI r10, 0x1F47F4
  LDI r8, 1788
  LDI r11, 2
  LDI r15, 0
  LDI r0, 2512
  LDI r14, 2
  LDI r2, 0xEF9DAA
  LDI r5, 256
  CALL func_0
func_0:
  AND r14, r10, r7
  SHL r10, r8, r6
  MOD r10, r13, r8
  XOR r9, r3, r7
  RET
  CALL func_1
func_1:
  SHR r15, r20, r8
  XOR r13, r1, r2
  ADD r14, r11, r4
  SUB r8, r11, r6
  RET
  HALT
