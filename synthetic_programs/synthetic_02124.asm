; subroutine calls
; initialization
  LDI r21, 0x697642
  LDI r4, 646
  LDI r5, 0x5F970B
  LDI r7, 2663
  LDI r8, 2735
  LDI r2, 0x2862D7
  LDI r13, 1
  CALL func_0
func_0:
  MOD r7, r0, r10
  MOD r8, r1, r6
  MUL r9, r10, r24
  RET
  CALL func_1
func_1:
  ADD r1, r7, r6
  MOD r14, r10, r5
  MOD r27, r31, r11
  OR r1, r11, r12
  RET
  HALT
