; mixed program
; initialization
  LDI r3, 0x3F935D
  LDI r10, 0x1C3CA0
  PUSH r6
  PUSH r12
  PUSH r8
  PUSH r1
  ADD r7, r10, r13
  SHL r8, r10, r3
  MUL r7, r13, r3
  MUL r22, r4, r8
  POP r1
  POP r8
  POP r12
  POP r6
  XOR r9, r10, r0
  XOR r6, r9, r29
  AND r9, r14, r11
  SUB r6, r5, r0
  CMP r12, r11
  JNZ r12, else_0
  SHL r5, r4, r8
  JMP endif_1
else_0:
  LDI r7, 2
  LDI r5, 0xD89E53
  LDI r14, 0xF52F77
  LDI r4, 0
  LDI r11, 2516
  LINE r7, r5, r14, r4, r11
  LDI r0, 255
  LDI r15, 0
  LDI r6, 581
  LDI r7, 0
  CIRCLE r0, r15, r6, r7
  LDI r4, 16
  LDI r12, 3009
  LDI r6, 1027
  LDI r0, 0x7BA771
  LDI r1, 3537
  LINE r4, r12, r6, r0, r1
endif_1:
  CMP r9, r13
  JZ r9, else_2
  XOR r8, r31, r15
  SHR r0, r15, r4
  XOR r13, r11, r7
  SUB r1, r9, r3
  JMP endif_3
else_2:
  LDI r7, 1
  LDI r14, 10
  LDI r27, 0x16D733
  LDI r9, 0x559EB2
  LDI r2, 2396
  RECTF r7, r14, r27, r9, r2
  LDI r1, 0x9D6300
  FILL r1
  LDI r7, 16
  LDI r12, 0
  LDI r10, 4
  PSETI
  LDI r10, 0x8CEAC1
  LDI r6, 0xD62791
  LDI r2, 4
  LDI r9, 0x121580
  LDI r4, 10
  LINE r10, r6, r2, r9, r4
endif_3:
  LDI r10, 4
  LDI r14, 1365
  LDI r8, 1691
  DRAWTEXT r10, r14, r8, "WORLD"
  CMP r0, r13
main_4:
  LDI r1, 59
  LDI r9, 0xE76864
  LDI r9, 3670
  TEXT r1, r9, r9, "HELLO"
  ANDI r14, r0, 151
  ADDI r0, r11, 0x7380AC
  SAR r6, r0, r4
  SHR r10, r9, r3
  FRAME
  JMP main_4
