; subroutine calls
; initialization
  LDI r7, 0x4A39EE
  LDI r8, 0xD94B87
  LDI r4, 0xFB4695
  LDI r13, 0x9A53E4
  LDI r6, 0x78F6A9
  LDI r15, 0x5830E7
  LDI r10, 0x566BC1
  CALL func_0
func_0:
  MOD r4, r14, r6
  DIV r5, r3, r14
  SHR r23, r8, r14
  MOD r14, r5, r4
  MOD r12, r10, r3
  SHR r2, r7, r4
  RET
  HALT
