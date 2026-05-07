; mixed program
; initialization
  LDI r3, 0xE7367B
  LDI r8, 0x4318A9
  LDI r9, 809
  LDI r10, 1
  LDI r2, 0xDE1097
  LDI r6, 3087
  LDI r12, 0x942730
  LDI r31, 0xF14B52
  DRAWTEXT r6, r12, r31, "WORLD"
  LDI r6, 0x1B34AF
  LDI r11, 1256
  LDI r0, 3766
  DRAWTEXT r6, r11, r0, "WORLD"
  CMPI r9, 0
  LDI r0, 0x8C2107
  LDI r2, 16
  LDI r8, 128
  DRAWTEXT r0, r2, r8, "WORLD"
  SAR r6, r1, r13
  SHLI r18, r4, 0xD92F73
  SHLI r2, r3, 16
  CALL func_0
func_0:
  XOR r14, r4, r1
  MUL r18, r0, r2
  DIV r1, r4, r11
  XOR r5, r0, r15
  XOR r8, r2, r3
  ADD r22, r5, r3
  RET
  HALT
