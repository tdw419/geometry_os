; mixed program
; initialization
  LDI r2, 0xC45580
  LDI r3, 2
  LDI r0, 10
  LDI r15, 2
  LDI r23, 0x81F1A8
  LDI r7, 0x3CAC89
  MOD r8, r9, r11
  LDI r3, 255
loop_0:
  LDI r5, 0x8C36D4
  LDI r5, 2285
  LDI r9, 0xCED0C5
  PSET r5, r5, r9
  MUL r5, r11, r10
  LDI r9, 0
  LDI r10, 0xE0A55A
  LDI r12, 2928
  LDI r0, 2819
  LDI r2, 0x964803
  LINE r9, r10, r12, r0, r2
  CMPI r11, r9, 0
  LDI r6, 1
  SUB r3, r3, r6
  JNZ r3, loop_0
  AND r15, r27, r3
  AND r14, r11, r15
  XOR r7, r3, r6
  LDI r5, 0x510D65
loop_1:
  OR r9, r11, r12
  ADD r0, r9, r12
  LDI r10, 1
  SUB r5, r5, r10
  JNZ r5, loop_1
  OR r3, r14, r15
  AND r0, r5, r10
  AND r1, r5, r10
  OR r14, r1, r30
  XOR r12, r2, r14
  LDI r6, 0xD27BA0
  LDI r3, 0xDECA26
  LDI r2, 951
  WPIXEL
  HALT
