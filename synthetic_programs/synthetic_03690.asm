; mixed program
; initialization
  LDI r3, 2
  LDI r9, 0x0129FC
  LDI r2, 0xF8A7CD
  LDI r12, 0xE2AE3D
  LDI r6, 0
  LDI r7, 1194
  LDI r1, 2
  LDI r30, 2834
  IKEY r6
  CMPI r6, 103
  JNZ r6, key_0
  LDI r15, 4
  LDI r6, 3733
  LDI r13, 2
  DRAWTEXT r15, r6, r13, "WORLD"
  CALL func_1
func_1:
  ADD r15, r0, r9
  MOD r3, r11, r5
  SHR r11, r2, r15
  ADD r5, r9, r0
  MUL r6, r3, r11
  DIV r10, r3, r12
  RET
  SHLI r11, r12, 64
  SHLI r12, r10, 128
  SAR r14, r7, r4
  PUSH r8
  PUSH r6
  OR r1, r15, r3
  ADD r7, r26, r11
  XOR r7, r8, r9
  POP r6
  POP r8
  HALT
