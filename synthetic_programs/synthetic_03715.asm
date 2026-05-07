; subroutine calls
; initialization
  LDI r11, 0x2B6161
  LDI r15, 324
  LDI r0, 3662
  LDI r14, 3899
  LDI r10, 0xB0B0AE
  LDI r12, 0x5ADB5C
  LDI r5, 2802
  LDI r6, 256
  CALL func_0
func_0:
  XOR r1, r12, r9
  OR r8, r7, r1
  MUL r8, r6, r13
  MOD r5, r6, r1
  AND r2, r4, r9
  SUB r7, r29, r14
  RET
  CALL func_1
func_1:
  SHR r7, r13, r1
  MOD r15, r4, r3
  SHL r4, r13, r12
  SHR r8, r11, r4
  ADD r11, r2, r16
  SHL r5, r14, r11
  RET
  HALT
