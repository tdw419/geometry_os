; drawing loop program
; initialization
  LDI r3, 777
  LDI r11, 2429
  LDI r14, 2996
main_0:
  LDI r4, 128
  LDI r10, 16
  LDI r5, 2582
  PSETI
  LDI r11, 1559
  LDI r4, 0x8C6D94
  LDI r6, 1528
  LDI r30, 32
  LDI r5, 0x9ECD5D
  RECTF r11, r4, r6, r30, r5
  SUBI r6, r7, 130
  IKEY r25
  CMPI r25, 32
  JNZ r25, key_1
  LDI r14, 2368
  LDI r1, 128
  LDI r9, 32
  LDI r1, 2676
  LDI r8, 586
  LINE r14, r1, r9, r1, r8
  AND r5, r0, r3
  OR r27, r26, r8
  FRAME
  JMP main_0
