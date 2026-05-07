; subroutine calls
; initialization
  LDI r3, 226
  LDI r13, 0x004598
  LDI r5, 0x63EFDC
  LDI r14, 128
  LDI r15, 0x802A32
  LDI r4, 64
  LDI r7, 0xD996A8
  CALL func_0
func_0:
  OR r5, r15, r0
  XOR r5, r1, r4
  RET
  CALL func_1
func_1:
  MUL r0, r8, r6
  SHL r15, r6, r5
  AND r4, r0, r2
  ADD r5, r4, r14
  RET
  HALT
