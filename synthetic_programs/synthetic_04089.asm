; subroutine calls
; initialization
  LDI r2, 0x0372DB
  LDI r4, 611
  LDI r6, 8
  LDI r11, 0xB019B9
  LDI r5, 0xA15F2A
  LDI r7, 16
  LDI r8, 0x55828C
  LDI r0, 0x626AA9
  CALL func_0
func_0:
  SHL r7, r1, r27
  SHL r27, r12, r0
  ADD r10, r6, r14
  RET
  CALL func_1
func_1:
  SHL r24, r2, r8
  MUL r10, r0, r14
  SHL r10, r6, r4
  SHR r12, r10, r8
  SHR r8, r4, r1
  RET
  CALL func_2
func_2:
  OR r11, r5, r4
  MOD r1, r10, r15
  RET
  HALT
