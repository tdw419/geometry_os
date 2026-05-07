; subroutine calls
; initialization
  LDI r4, 2461
  LDI r5, 0x11E3A5
  LDI r13, 3958
  LDI r1, 2610
  LDI r11, 3133
  LDI r7, 128
  LDI r6, 1
  LDI r0, 755
  CALL func_0
func_0:
  SUB r14, r13, r10
  XOR r9, r27, r11
  MOD r11, r0, r16
  AND r12, r2, r0
  ADD r10, r20, r0
  RET
  CALL func_1
func_1:
  DIV r8, r4, r10
  SHL r0, r2, r1
  SUB r4, r11, r7
  RET
  HALT
