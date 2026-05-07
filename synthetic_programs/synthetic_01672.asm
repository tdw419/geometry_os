; counted animation
; initialization
  LDI r5, 46
  LDI r14, 4
  LDI r9, 0xB0838F
  LDI r15, 2
  LDI r13, 0x439330
  LDI r1, 0x94E857
  LDI r12, 8
loop_0:
  AND r13, r6, r7
  CMPI r14, r8, 99
  LDI r3, 0x82BE22
  LDI r28, 0xC2ADED
  LDI r9, 3309
  PSET r3, r28, r9
  LDI r5, 16
  LDI r4, 0x08269C
  LDI r9, 8
  LDI r3, 0x53384D
  LDI r2, 4
  RECTF r5, r4, r9, r3, r2
  LDI r2, 1
  SUB r12, r12, r2
  JNZ r12, loop_0
  LDI r14, 16
loop_1:
  OR r15, r4, r6
  CMPI r9, r2, 128
  LDI r10, 255
  LDI r8, 64
  LDI r9, 2037
  PSETI
  LDI r0, 1
  SUB r14, r14, r0
  JNZ r14, loop_1
  LDI r5, 40
loop_2:
  LDI r11, 64
  LDI r6, 255
  LDI r11, 2982
  LDI r15, 2116
  LDI r12, 0x4E2A4E
  LINE r11, r6, r11, r15, r12
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_2
  HALT
