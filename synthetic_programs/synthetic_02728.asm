; subroutine calls
; initialization
  LDI r16, 0x7ABB83
  LDI r14, 600
  LDI r5, 0
  LDI r11, 4
  LDI r1, 8
  LDI r2, 1
  LDI r13, 0xC7AB22
  LDI r8, 0
  CALL func_0
func_0:
  SHL r10, r9, r30
  SHL r7, r1, r3
  RET
  CALL func_1
func_1:
  ADD r1, r6, r13
  SHR r0, r14, r4
  ADD r2, r9, r11
  RET
  HALT
