; mixed program
; initialization
  LDI r23, 3006
  LDI r10, 2441
  LDI r15, 353
  LDI r7, 2524
  LDI r6, 1430
  LDI r4, 2809
  LDI r0, 0xC5BEC9
  LDI r14, 2348
  IKEY r3
  CMPI r3, 20
  JNZ r3, key_0
  AND r11, r7, r14
  CMP r0, r9
  XOR r3, r8, r14
  AND r3, r14, r4
  CMP r9, r25
  JZ r9, else_1
  MUL r12, r14, r13
  DIV r15, r2, r5
  JMP endif_2
else_1:
  LDI r9, 0x8072E4
  LDI r8, 1019
  LDI r15, 2
  WPIXEL
  LDI r6, 0x167626
  LDI r8, 0x2AAB50
  LDI r14, 2
  PSETI
  LDI r5, 255
  LDI r1, 256
  LDI r3, 0x315531
  WPIXEL
  LDI r3, 8
  LDI r1, 255
  LDI r15, 10
  LDI r6, 0x64D066
  LDI r4, 1
  LINE r3, r1, r15, r6, r4
endif_2:
  SHR r14, r3, r0
  SUB r0, r2, r12
  HALT
