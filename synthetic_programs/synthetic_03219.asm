; mixed program
; initialization
  LDI r1, 1
  LDI r5, 0xCCE58C
  CMP r7, r12
  JNZ r7, else_0
  OR r5, r7, r1
  DIV r3, r19, r13
  OR r4, r3, r11
  XOR r15, r11, r4
  JMP endif_1
else_0:
  LDI r6, 1363
  LDI r9, 2690
  LDI r11, 0x4ABBD7
  LDI r11, 3394
  LDI r4, 0x0F9656
  LINE r6, r9, r11, r11, r4
  LDI r12, 2157
  LDI r7, 256
  LDI r12, 0
  PSETI
  LDI r12, 732
  FILL r12
  LDI r8, 0xC55D30
  FILL r8
endif_1:
  CMP r1, r2
  JNZ r1, else_2
  AND r0, r11, r9
  JMP endif_3
else_2:
  LDI r0, 4
  LDI r7, 3593
  LDI r9, 10
  WPIXEL
  LDI r11, 1
  LDI r15, 1952
  LDI r5, 3160
  PSET r11, r15, r5
endif_3:
  SHR r3, r4, r9
  SAR r12, r1, r13
main_4:
  IKEY r2
  CMPI r2, 0x96FFD0
  JNZ r2, key_5
  LDI r8, 179
  LDI r1, 0x1B7711
  LDI r12, 2531
  DRAWTEXT r8, r1, r12, "WORLD"
  FRAME
  JMP main_4
