; mixed program
; initialization
  LDI r6, 0
  LDI r5, 10
  LDI r15, 1186
  LDI r4, 1
  LDI r14, 8
  LDI r13, 3282
  LDI r22, 8
  LDI r11, 0xD90D67
  OR r3, r12, r1
  XOR r13, r6, r15
  OR r19, r11, r12
  OR r11, r1, r10
  XOR r5, r14, r10
  IKEY r15
  CMPI r15, 0x21C0E2
  JNZ r15, key_0
  CMP r12, r8
  JZ r12, else_1
  OR r2, r3, r15
  DIV r11, r0, r3
  SUB r25, r15, r5
  JMP endif_2
else_1:
  LDI r1, 356
  LDI r15, 256
  LDI r2, 64
  WPIXEL
  LDI r0, 0x71914E
  FILL r0
  LDI r0, 128
  LDI r12, 541
  LDI r14, 2544
  LDI r10, 3777
  LDI r1, 0x3D00D5
  RECTF r0, r12, r14, r10, r1
  LDI r5, 2385
  LDI r15, 16
  LDI r10, 0x5A7785
  PSET r5, r15, r10
endif_2:
  CMPI r2, 183
  CMP r3, r1
  LDI r15, 1
  LDI r7, 10
  LDI r4, 64
  DRAWTEXT r15, r7, r4, "WORLD"
  SHR r5, r9, r10
  SHLI r2, r3, 0x7FEC19
  SHR r3, r24, r14
  HALT
