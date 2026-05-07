; input driven program
; initialization
  LDI r0, 128
  LDI r8, 64
  LDI r1, 0x64E9D2
  LDI r14, 3854
  LDI r11, 64
main_0:
  LDI r0, 128
  LDI r14, 835
  LDI r13, 16
  PSETI
  DIV r1, r3, r14
  IKEY r11
  CMPI r11, 131
  JNZ r11, key_1
  AND r2, r6, r14
  XOR r8, r12, r14
  XOR r0, r9, r4
  OR r12, r7, r2
  LDI r3, 0
  LDI r5, 0xF882AE
  LDI r8, 0x3F9A8D
  DRAWTEXT r3, r5, r8, "WORLD"
  FRAME
  JMP main_0
