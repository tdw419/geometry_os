; mixed program
; initialization
  LDI r7, 255
  LDI r2, 1857
  LDI r8, 0xDC0843
  LDI r0, 0x87DA43
  LDI r3, 2470
  TEXT r8, r0, r3, "HELLO"
  IKEY r12
  CMPI r12, 8
  JNZ r12, key_0
  CALL func_1
func_1:
  ADD r3, r5, r1
  DIV r8, r7, r12
  ADD r1, r6, r0
  RET
  SHLI r16, r9, 0
  SHL r12, r15, r8
  SHR r5, r14, r7
  LDI r4, 128
  LDI r14, 0xEC9995
  LDI r9, 2381
  DRAWTEXT r4, r14, r9, "WORLD"
  SHL r8, r15, r6
  CALL func_2
func_2:
  AND r0, r10, r14
  OR r5, r12, r6
  DIV r14, r9, r10
  RET
  HALT
