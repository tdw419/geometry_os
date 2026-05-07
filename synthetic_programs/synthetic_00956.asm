; conditional logic
; initialization
  LDI r8, 3471
  LDI r11, 2567
  LDI r10, 32
  LDI r14, 0x286AD0
  LDI r17, 537
  LDI r4, 128
  CMP r3, r0
  JNZ r3, else_0
  OR r6, r9, r14
  DIV r0, r3, r7
  JMP endif_1
else_0:
  LDI r7, 2530
  LDI r11, 16
  LDI r9, 4089
  PSETI
  LDI r9, 4
  LDI r2, 190
  LDI r15, 1713
  PSETI
  LDI r8, 1
  LDI r7, 4
  LDI r11, 1195
  PSETI
  LDI r15, 0x3E28A9
  LDI r9, 657
  LDI r7, 255
  PSETI
endif_1:
  CMP r9, r12
  JZ r9, else_2
  OR r5, r26, r6
  SHR r0, r1, r6
  OR r0, r10, r2
  MUL r15, r11, r5
  JMP endif_3
else_2:
  LDI r11, 0x347E27
  LDI r2, 0x37291D
  LDI r7, 3361
  LDI r0, 822
  LDI r3, 1421
  LINE r11, r2, r7, r0, r3
  LDI r10, 2192
  LDI r6, 2267
  LDI r2, 2
  WPIXEL
  LDI r5, 0xC0C2AC
  LDI r8, 3729
  LDI r13, 4089
  LDI r4, 2
  LDI r0, 3493
  RECTF r5, r8, r13, r4, r0
endif_3:
  CMP r3, r2
  JZ r3, else_4
  AND r4, r9, r12
  MUL r10, r14, r0
  AND r7, r20, r2
  JMP endif_5
else_4:
  LDI r9, 0x1AF45D
  LDI r6, 0x6B5D61
  LDI r3, 2
  PSET r9, r6, r3
endif_5:
  HALT
