; mixed program
; initialization
  LDI r5, 1
  LDI r11, 16
  CMP r1, r11
  JNZ r1, else_0
  MUL r10, r3, r15
  MUL r16, r1, r7
  JMP endif_1
else_0:
  LDI r2, 2
  LDI r5, 0
  LDI r7, 0
  LDI r11, 0xAD5413
  LDI r2, 8
  LINE r2, r5, r7, r11, r2
  LDI r12, 3190
  LDI r3, 3265
  LDI r4, 3427
  LDI r26, 0x5D99A9
  CIRCLE r12, r3, r4, r26
endif_1:
  AND r5, r0, r1
  SHL r10, r1, r2
  SHLI r9, r10, 0x5BD635
  SAR r8, r4, r6
  LDI r4, 0x2F95E0
  LDI r4, 256
  LDI r10, 1290
  DRAWTEXT r4, r4, r10, "WORLD"
  SHL r20, r16, r10
  SAR r8, r2, r4
  SHLI r1, r15, 2
  SHR r2, r9, r14
  AND r1, r9, r11
  AND r5, r9, r3
  XOR r7, r11, r15
  SAR r1, r0, r2
  SAR r15, r3, r7
  HALT
