; mixed program
; initialization
  LDI r6, 0x184F02
  LDI r5, 0xDE4AED
  LDI r3, 2347
  LDI r4, 4
  LDI r2, 256
  LDI r15, 0x05EC8E
  LDI r27, 163
  LDI r8, 255
  SHLI r1, r10, 6
  SHLI r15, r14, 6
  AND r13, r5, r2
  XOR r10, r14, r1
  AND r13, r6, r0
  SHR r0, r14, r15
  SHR r3, r2, r11
  SHR r0, r13, r17
  SAR r9, r12, r2
  CMP r14, r8
  JZ r14, else_0
  XOR r11, r17, r5
  MUL r14, r10, r13
  SUB r3, r6, r9
  JMP endif_1
else_0:
  LDI r4, 1988
  LDI r0, 64
  LDI r0, 1875
  LDI r8, 1
  CIRCLE r4, r0, r0, r8
endif_1:
  IKEY r8
  CMPI r8, 2
  JNZ r8, key_2
  LDI r11, 0x33B68D
  LDI r9, 255
  LDI r8, 1578
  LDI r3, 3869
  LDI r7, 1357
  LINE r11, r9, r8, r3, r7
  LDI r1, 2
loop_3:
  LDI r10, 256
  LDI r26, 1704
  LDI r13, 0xDE1CF8
  LDI r27, 2330
  CIRCLE r10, r26, r13, r27
  LDI r14, 1
  SUB r1, r1, r14
  JNZ r1, loop_3
  LDI r11, 3232
  LDI r12, 3853
  LDI r4, 0xEFEBDB
  LDI r6, 0x4CCB2C
  LDI r22, 2184
  LINE r11, r12, r4, r6, r22
  HALT
