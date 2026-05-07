; counted animation
; initialization
  LDI r4, 64
  LDI r2, 366
  LDI r3, 1435
  LDI r5, 1277
  LDI r6, 2536
  LDI r1, 3495
  LDI r15, 47
loop_0:
  LDI r6, 32
  LDI r9, 3712
  LDI r15, 16
  WPIXEL
  SUBI r11, r0, 4
  CMPI r1, r0, 64
  SUBI r10, r8, 173
  LDI r5, 1
  SUB r15, r15, r5
  JNZ r15, loop_0
  LDI r13, 128
loop_1:
  LDI r17, 0x5AB181
  LDI r11, 0xD76334
  LDI r14, 901
  WPIXEL
  MOD r0, r7, r1
  CMPI r9, r6, 8
  SHL r8, r2, r14
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_1
  LDI r6, 32
loop_2:
  ANDI r11, r19, 0x2239CF
  LDI r23, 0x449DF2
  LDI r10, 2440
  LDI r21, 0xCBECE3
  WPIXEL
  LDI r10, 1
  SUB r6, r6, r10
  JNZ r6, loop_2
  HALT
