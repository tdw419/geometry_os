; mixed program
; initialization
  LDI r11, 256
  LDI r1, 3478
  LDI r10, 64
  LDI r4, 128
  CMP r26, r0
  JNZ r26, else_0
  DIV r0, r6, r12
  JMP endif_1
else_0:
  LDI r5, 0x1F2945
  LDI r1, 64
  LDI r3, 1
  LDI r4, 64
  CIRCLE r5, r1, r3, r4
  LDI r4, 1437
  LDI r9, 0x68DE6C
  LDI r12, 249
  LDI r0, 0x995742
  CIRCLE r4, r9, r12, r0
endif_1:
  OR r13, r6, r14
  OR r0, r11, r1
  OR r7, r8, r3
  XOR r12, r0, r4
  AND r6, r7, r15
  XOR r3, r11, r5
  XOR r12, r10, r14
  HALT
