; subroutine calls
; initialization
  LDI r1, 65
  LDI r2, 0x7AD71A
  LDI r20, 0xC16FFF
  LDI r10, 0x7B7CAE
  LDI r8, 0x53E017
  LDI r0, 16
  LDI r5, 2442
  CALL func_0
func_0:
  DIV r11, r14, r19
  DIV r23, r5, r8
  RET
  CALL func_1
func_1:
  ADD r4, r3, r15
  MOD r5, r8, r2
  AND r11, r13, r9
  MOD r15, r6, r24
  RET
  HALT
