; mixed program
; initialization
  LDI r1, 1
  LDI r13, 2380
  CALL func_0
func_0:
  MOD r3, r9, r2
  XOR r3, r13, r1
  MUL r8, r5, r10
  MOD r4, r10, r1
  XOR r0, r6, r8
  RET
  LDI r7, 256
  LDI r20, 256
  LDI r4, 0xFE4591
  PSETI
  SHLI r4, r12, 256
  SHLI r2, r15, 0x4919F3
  SAR r8, r16, r9
  SHLI r11, r7, 7
  HALT
