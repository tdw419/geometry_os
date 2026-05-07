; mixed program
; initialization
  LDI r5, 128
  LDI r12, 0x79DE8C
  LDI r6, 104
  LDI r14, 64
  LDI r11, 0x725AAD
  LDI r13, 861
  LDI r7, 256
  LDI r9, 2426
  CMP r4, r27
  JZ r4, else_0
  MUL r11, r7, r4
  XOR r1, r5, r18
  SUB r0, r5, r11
  SHR r2, r30, r0
  JMP endif_1
else_0:
  LDI r4, 16
  LDI r22, 64
  LDI r4, 3996
  PSETI
  LDI r1, 16
  LDI r13, 0xD7F1A6
  LDI r7, 2415
  LDI r7, 1448
  LDI r15, 128
  LINE r1, r13, r7, r7, r15
  LDI r15, 2
  FILL r15
  LDI r16, 2717
  LDI r9, 3973
  LDI r3, 0x3552EA
  PSET r16, r9, r3
endif_1:
  CMP r4, r1
  JZ r4, else_2
  XOR r12, r8, r9
  SHR r6, r12, r8
  XOR r11, r9, r6
  SHR r0, r23, r3
  JMP endif_3
else_2:
  LDI r7, 0xC2941F
  LDI r11, 2318
  LDI r16, 1703
  LDI r5, 0
  LDI r1, 1
  RECTF r7, r11, r16, r5, r1
endif_3:
  XOR r11, r12, r13
  AND r5, r14, r8
main_4:
  LDI r1, 64
  LDI r7, 2
  LDI r14, 2229
  TEXT r1, r7, r14, "HELLO"
  XOR r1, r10, r14
  OR r19, r15, r11
  AND r9, r11, r15
  OR r1, r5, r15
  LDI r2, 64
  LDI r14, 1585
  LDI r12, 0
  LDI r13, 0x59D6B8
  LDI r0, 8
  RECTF r2, r14, r12, r13, r0
  FRAME
  JMP main_4
