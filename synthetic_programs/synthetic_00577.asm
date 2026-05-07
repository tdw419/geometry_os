; subroutine calls
; initialization
  LDI r9, 3024
  LDI r2, 255
  LDI r4, 10
  LDI r3, 2
  LDI r14, 0x831719
  LDI r1, 2
  LDI r23, 0xAD34FA
  LDI r0, 3844
  CALL func_0
func_0:
  MUL r8, r10, r14
  MOD r14, r10, r0
  ADD r5, r4, r8
  RET
  CALL func_1
func_1:
  XOR r5, r6, r4
  SUB r5, r6, r1
  SUB r3, r28, r9
  SHL r17, r1, r14
  RET
  HALT
