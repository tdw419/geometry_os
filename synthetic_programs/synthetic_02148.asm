; mixed program
; initialization
  LDI r8, 0x73F36A
  LDI r3, 255
  LDI r1, 0xD0CAFD
  LDI r7, 32
  LDI r13, 16
  LDI r9, 8
  LDI r2, 0xF67DB9
  LDI r0, 3670
  SHR r1, r3, r8
  SHLI r10, r1, 3
  LDI r6, 2
  LDI r11, 32
  LDI r7, 1923
  DRAWTEXT r6, r11, r7, "WORLD"
  CALL func_0
func_0:
  OR r9, r4, r3
  AND r11, r28, r8
  ADD r11, r12, r7
  RET
  CMP r12, r1
  JZ r12, else_1
  OR r10, r11, r13
  JMP endif_2
else_1:
  LDI r8, 2157
  LDI r2, 2217
  LDI r12, 8
  WPIXEL
  LDI r12, 2500
  LDI r5, 3463
  LDI r4, 16
  LDI r9, 4
  CIRCLE r12, r5, r4, r9
  LDI r2, 0xF7A59F
  LDI r4, 2
  LDI r6, 1406
  LDI r15, 3228
  LDI r11, 255
  LINE r2, r4, r6, r15, r11
endif_2:
  PUSH r1
  PUSH r14
  PUSH r1
  MUL r5, r12, r9
  DIV r9, r6, r23
  AND r7, r11, r13
  POP r1
  POP r14
  POP r1
  ADD r1, r4, r7
  HALT
