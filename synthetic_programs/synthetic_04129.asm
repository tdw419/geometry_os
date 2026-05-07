; mixed program
; initialization
  LDI r6, 6
  LDI r14, 255
  LDI r1, 0x302E6D
  LDI r2, 255
  LDI r8, 64
  CALL func_0
func_0:
  SHR r14, r10, r12
  SUB r4, r13, r7
  MUL r6, r16, r4
  MUL r0, r11, r1
  ADD r8, r6, r5
  RET
  CMPI r3, 1
  LDI r4, 311
  LDI r4, 1774
  LDI r14, 1
  DRAWTEXT r4, r4, r14, "WORLD"
  HALT
