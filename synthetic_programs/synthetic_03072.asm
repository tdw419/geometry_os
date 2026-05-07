; mixed program
; initialization
  LDI r6, 1518
  LDI r7, 0x5AE502
  LDI r15, 255
  LDI r14, 0xC11F09
  LDI r12, 0x5A4E8D
  LDI r4, 32
  LDI r3, 0xD91DE9
  LDI r2, 0xCE4B73
  OR r14, r5, r15
  OR r1, r2, r8
  AND r13, r12, r4
  AND r0, r27, r3
  XOR r3, r9, r1
  LDI r12, 8
  STORE r12, r13
  LOAD r2, r12
  LDI r0, 104
  STORE r0, r15
  LOAD r13, r0
  LDI r7, 256
  STORE r7, r12
  LOAD r1, r7
  LDI r12, 0x3364AB
  STORE r12, r8
  LOAD r9, r12
  CMPI r4, 220
  CMP r14, r8
  JNZ r14, else_0
  MUL r10, r7, r2
  XOR r13, r0, r6
  SUB r17, r9, r0
  MUL r3, r13, r0
  JMP endif_1
else_0:
  LDI r2, 64
  LDI r14, 256
  LDI r9, 582
  PSETI
  LDI r14, 8
  LDI r1, 128
  LDI r7, 3515
  PSETI
  LDI r11, 8
  LDI r12, 32
  LDI r5, 256
  PSETI
endif_1:
  CMP r2, r1
  JZ r2, else_2
  AND r14, r6, r8
  JMP endif_3
else_2:
  LDI r13, 1929
  LDI r11, 0x908306
  LDI r4, 0xF78321
  LDI r31, 3345
  CIRCLE r13, r11, r4, r31
  LDI r1, 978
  LDI r6, 2
  LDI r13, 2459
  PSETI
  LDI r6, 0x711B0C
  LDI r4, 2831
  LDI r11, 2535
  WPIXEL
  LDI r4, 1143
  LDI r15, 0
  LDI r6, 16
  LDI r0, 1176
  LDI r10, 16
  RECTF r4, r15, r6, r0, r10
endif_3:
  CMP r22, r10
  JZ r22, else_4
  SHR r4, r13, r3
  OR r13, r11, r6
  SUB r7, r0, r14
  SUB r3, r15, r8
  JMP endif_5
else_4:
  LDI r11, 2214
  LDI r10, 305
  LDI r14, 604
  PSETI
  LDI r12, 0xA4174E
  LDI r5, 0
  LDI r13, 3237
  LDI r5, 0x206E9A
  LDI r13, 32
  RECTF r12, r5, r13, r5, r13
  LDI r13, 2524
  LDI r12, 0x22953C
  LDI r2, 1981
  LDI r0, 32
  LDI r15, 0x7C0580
  RECTF r13, r12, r2, r0, r15
endif_5:
  HALT
