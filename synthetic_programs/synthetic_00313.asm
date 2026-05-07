; mixed program
; initialization
  LDI r10, 3452
  LDI r15, 0xE110BC
  LDI r31, 0x0FE274
  LDI r5, 616
  LDI r4, 3197
  XOR r6, r15, r12
  OR r10, r4, r6
  OR r8, r4, r12
  AND r1, r12, r13
  CALL func_0
func_0:
  DIV r8, r1, r22
  OR r4, r28, r5
  AND r15, r3, r7
  SHR r0, r10, r13
  MUL r1, r12, r2
  MUL r5, r0, r12
  RET
  OR r0, r9, r5
  CMP r0, r13
  JNZ r0, else_1
  OR r9, r8, r15
  MUL r6, r15, r29
  DIV r7, r2, r1
  JMP endif_2
else_1:
  LDI r9, 128
  LDI r31, 2141
  LDI r3, 538
  LDI r15, 0x550F35
  LDI r7, 0x51A88E
  RECTF r9, r31, r3, r15, r7
  LDI r14, 0
  LDI r6, 0x24F2FE
  LDI r3, 2526
  LDI r7, 10
  CIRCLE r14, r6, r3, r7
  LDI r2, 1366
  LDI r6, 0x85FF2F
  LDI r11, 0xE834CB
  LDI r12, 0x34B23E
  LDI r11, 0x15C578
  LINE r2, r6, r11, r12, r11
endif_2:
  SUB r5, r2, r0
main_3:
  LDI r2, 1
  LDI r8, 256
  LDI r12, 0xEE4C1B
  LDI r15, 0x908EA0
  LDI r0, 1676
  RECTF r2, r8, r12, r15, r0
  AND r27, r12, r13
  AND r2, r8, r3
  LDI r11, 2768
  LDI r7, 16
  LDI r1, 1227
  TEXT r11, r7, r1, "HELLO"
  LDI r6, 3437
  LDI r7, 0x198AE2
  LDI r12, 0xB94B6B
  LDI r6, 0x33CDC1
  CIRCLE r6, r7, r12, r6
  AND r0, r9, r4
  XOR r11, r9, r7
  XOR r12, r0, r8
  XOR r11, r9, r1
  FRAME
  JMP main_3
