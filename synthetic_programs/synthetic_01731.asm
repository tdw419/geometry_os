; mixed program
; initialization
  LDI r6, 861
  LDI r1, 2
  LDI r4, 4
  LDI r15, 0xD1D720
  CMP r13, r0
  JNZ r13, else_0
  SHL r10, r13, r6
  JMP endif_1
else_0:
  LDI r9, 3230
  LDI r8, 16
  LDI r2, 1261
  LDI r2, 1670
  LDI r14, 0x31375D
  LINE r9, r8, r2, r2, r14
  LDI r3, 3899
  LDI r26, 256
  LDI r7, 32
  LDI r8, 2884
  LDI r2, 952
  RECTF r3, r26, r7, r8, r2
endif_1:
  OR r3, r12, r0
  AND r9, r6, r14
  OR r2, r6, r0
  XOR r4, r3, r8
  LDI r11, 64
  STORE r11, r9
  LOAD r13, r11
  LDI r4, 0x588D77
  STORE r4, r13
  LOAD r9, r4
  LDI r15, 2
  STORE r15, r9
  LOAD r13, r15
  SHLI r23, r4, 0x7F8195
  SAR r8, r14, r4
  SHLI r4, r1, 0xB9485B
  SHR r7, r13, r1
  OR r13, r6, r7
  OR r9, r6, r11
  OR r1, r12, r7
  LDI r3, 14
loop_2:
  ANDI r13, r11, 8
  LDI r15, 1
  SUB r3, r3, r15
  JNZ r3, loop_2
  LDI r10, 2
loop_3:
  SHL r2, r7, r9
  LDI r6, 1
  SUB r10, r10, r6
  JNZ r10, loop_3
  HALT
