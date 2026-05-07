; conditional logic
; initialization
  LDI r7, 2926
  LDI r1, 32
  LDI r14, 1467
  LDI r11, 0xF3DD06
  LDI r6, 1
  CMP r12, r5
  JNZ r12, else_0
  SUB r3, r29, r11
  XOR r7, r14, r11
  SUB r2, r9, r7
  AND r15, r5, r14
  JMP endif_1
else_0:
  LDI r13, 1432
  LDI r8, 3826
  LDI r6, 255
  WPIXEL
  LDI r11, 3444
  LDI r1, 64
  LDI r7, 64
  WPIXEL
  LDI r2, 0
  LDI r11, 128
  LDI r11, 4
  WPIXEL
endif_1:
  CMP r5, r15
  JZ r5, else_2
  DIV r8, r15, r6
  JMP endif_3
else_2:
  LDI r5, 611
  LDI r2, 8
  LDI r3, 3180
  LDI r13, 0xC248AE
  LDI r7, 0x97B142
  LINE r5, r2, r3, r13, r7
  LDI r0, 0x92FBFC
  LDI r10, 3818
  LDI r26, 0x23E2FC
  LDI r9, 1
  LDI r2, 0x87EBAC
  LINE r0, r10, r26, r9, r2
  LDI r4, 0
  LDI r0, 1587
  LDI r10, 0xDAFED5
  PSET r4, r0, r10
  LDI r11, 16
  FILL r11
endif_3:
  CMP r5, r4
  JZ r5, else_4
  XOR r7, r5, r6
  SHL r11, r5, r9
  MOD r9, r10, r12
  DIV r9, r10, r4
  JMP endif_5
else_4:
  LDI r6, 0x32BD94
  LDI r15, 0xA87046
  LDI r11, 254
  PSETI
  LDI r2, 256
  LDI r11, 1
  LDI r0, 32
  PSET r2, r11, r0
  LDI r7, 255
  LDI r8, 32
  LDI r6, 1
  LDI r8, 2287
  LDI r2, 64
  LINE r7, r8, r6, r8, r2
endif_5:
  HALT
