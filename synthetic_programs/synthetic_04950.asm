; subroutine calls
; initialization
  LDI r6, 8
  LDI r2, 0x215908
  LDI r3, 32
  LDI r0, 2763
  LDI r4, 0xE5719C
  LDI r14, 0xFC91FB
  LDI r10, 1
  LDI r12, 2
  CALL func_0
func_0:
  ADD r3, r14, r12
  SHR r10, r8, r7
  MOD r2, r25, r1
  SUB r0, r1, r7
  RET
  CALL func_1
func_1:
  MUL r5, r12, r13
  XOR r0, r15, r8
  ADD r3, r8, r0
  SUB r29, r7, r6
  RET
  CALL func_2
func_2:
  XOR r12, r0, r11
  XOR r4, r0, r2
  OR r5, r10, r13
  RET
  CALL func_3
func_3:
  XOR r0, r7, r1
  SHR r7, r3, r12
  MUL r9, r8, r12
  ADD r1, r14, r9
  SUB r24, r10, r14
  ADD r8, r11, r13
  RET
  HALT
