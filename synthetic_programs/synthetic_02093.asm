; mixed program
; initialization
  LDI r12, 0x275ECF
  LDI r8, 277
  LDI r7, 982
  LDI r6, 0xC99C9B
  LDI r0, 2505
  LDI r3, 0xC4BF52
  LDI r1, 255
  CALL func_0
func_0:
  SHL r9, r10, r15
  SHR r8, r0, r5
  RET
  LDI r13, 365
  LDI r10, 16
  LDI r3, 0xF45C07
  DRAWTEXT r13, r10, r3, "WORLD"
  CMP r13, r9
  HALT
