; mixed program
; initialization
  LDI r2, 16
  LDI r6, 0x6E47FD
  LDI r10, 2759
  LDI r13, 3042
  LDI r1, 4
  LDI r0, 128
  LDI r17, 0x868275
  LDI r2, 0
  LDI r15, 206
  LDI r9, 0xCB9743
  LDI r15, 0x45E0A4
  LDI r8, 0x42821C
  LINE r2, r15, r9, r15, r8
  CALL func_0
func_0:
  XOR r0, r13, r3
  MUL r11, r2, r15
  SUB r11, r0, r2
  RET
  IKEY r10
  CMPI r10, 200
  JNZ r10, key_1
  CMP r6, r15
  JNZ r6, else_2
  OR r15, r3, r6
  SHR r0, r10, r12
  SHR r9, r6, r13
  AND r1, r13, r8
  JMP endif_3
else_2:
  LDI r10, 64
  LDI r15, 64
  LDI r11, 1030
  LDI r3, 3133
  LDI r26, 2505
  RECTF r10, r15, r11, r3, r26
endif_3:
  CMP r11, r6
  JZ r11, else_4
  OR r11, r18, r14
  OR r10, r4, r0
  JMP endif_5
else_4:
  LDI r14, 154
  LDI r9, 0x511811
  LDI r1, 0xCB866D
  LDI r0, 1134
  LDI r10, 2062
  LINE r14, r9, r1, r0, r10
  LDI r7, 61
  LDI r6, 10
  LDI r7, 3863
  PSET r7, r6, r7
  LDI r14, 0xD38AE9
  LDI r11, 0x1C2790
  LDI r5, 3498
  LDI r4, 0x24EC11
  LDI r11, 4
  RECTF r14, r11, r5, r4, r11
endif_5:
  LDI r14, 3254
  STORE r14, r1
  LOAD r11, r14
  LDI r7, 256
  STORE r7, r6
  LOAD r10, r7
  LDI r9, 424
  STORE r9, r5
  LOAD r1, r9
  LDI r11, 4
  STORE r11, r2
  LOAD r14, r11
  XOR r9, r22, r4
  AND r9, r5, r2
  XOR r0, r15, r2
  AND r1, r10, r8
main_6:
  CMP r2, r11
  LDI r10, 1538
  LDI r11, 0x8EC74E
  LDI r15, 1772
  LDI r14, 464
  LDI r9, 10
  RECTF r10, r11, r15, r14, r9
  SHR r3, r4, r13
  SAR r12, r5, r4
  SAR r10, r29, r9
  SHL r14, r6, r12
  LDI r2, 0
  LDI r9, 147
  LDI r1, 10
  DRAWTEXT r2, r9, r1, "WORLD"
  OR r7, r8, r3
  OR r1, r0, r24
  OR r15, r14, r3
  AND r10, r2, r7
  CMP r5, r12
  FRAME
  JMP main_6
