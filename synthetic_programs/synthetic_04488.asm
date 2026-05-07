; mixed program
; initialization
  LDI r0, 4
  LDI r6, 2657
  LDI r12, 531
  LDI r10, 0x8D30E6
  LDI r3, 64
  LDI r11, 16
  CALL func_0
func_0:
  SUB r1, r5, r0
  ADD r9, r1, r10
  SUB r11, r10, r29
  ADD r9, r13, r10
  AND r0, r2, r13
  RET
  LDI r1, 662
  STORE r1, r4
  LOAD r0, r1
  LDI r8, 2876
  STORE r8, r15
  LOAD r12, r8
  LDI r4, 0
  STORE r4, r7
  LOAD r1, r4
  LDI r4, 4
  STORE r4, r4
  LOAD r14, r4
  CMPI r4, 177
  CMP r8, r2
  JNZ r8, else_1
  DIV r1, r8, r4
  XOR r3, r11, r2
  JMP endif_2
else_1:
  LDI r1, 0x4D4454
  FILL r1
  LDI r9, 32
  LDI r11, 0x6F0DB4
  LDI r2, 8
  LDI r4, 3089
  LDI r9, 2
  RECTF r9, r11, r2, r4, r9
endif_2:
  LDI r1, 0x42F102
  LDI r6, 10
  LDI r6, 2427
  TEXT r1, r6, r6, "HELLO"
  HALT
