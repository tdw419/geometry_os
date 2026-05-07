; mixed program
; initialization
  LDI r6, 0xFF6F89
  LDI r10, 3405
  LDI r13, 0xCC5C60
  LDI r2, 10
  LDI r7, 0xC57D98
  SUB r0, r3, r15
  LDI r12, 4
  LDI r6, 0x1BACDD
  LDI r2, 3982
  DRAWTEXT r12, r6, r2, "WORLD"
  CALL func_0
func_0:
  XOR r2, r15, r4
  OR r7, r24, r2
  AND r5, r14, r12
  MUL r12, r9, r15
  RET
  SHR r9, r1, r15
  SHL r14, r2, r5
  LDI r5, 1661
  LDI r2, 10
  LDI r7, 2720
  DRAWTEXT r5, r2, r7, "WORLD"
  HALT
