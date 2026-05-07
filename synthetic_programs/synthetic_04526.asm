; mixed program
; initialization
  LDI r0, 4017
  LDI r5, 0
  LDI r15, 32
  LDI r4, 511
  LDI r6, 2351
  LDI r8, 2
  LDI r12, 0x108E99
  LDI r3, 3454
  LDI r13, 0xA3FFAD
  LDI r8, 4
  TEXT r3, r13, r8, "HELLO"
  LDI r13, 0x3FCE2F
  LDI r15, 4
  LDI r15, 0x56CA32
  PSET r13, r15, r15
  SAR r23, r10, r7
  SHL r14, r3, r12
  LDI r12, 32
  LDI r15, 0
  LDI r3, 1614
  DRAWTEXT r12, r15, r3, "WORLD"
  CMP r1, r15
  JZ r1, else_0
  MUL r12, r13, r6
  JMP endif_1
else_0:
  LDI r5, 0x3EA2F3
  LDI r7, 991
  LDI r4, 0x24C292
  WPIXEL
endif_1:
  LDI r5, 256
  LDI r12, 1865
  LDI r5, 0x39710A
  DRAWTEXT r5, r12, r5, "WORLD"
  SHLI r0, r14, 0x68C337
  SHR r10, r25, r5
main_2:
  LDI r11, 0xE0BF3E
  LDI r4, 32
  LDI r12, 8
  WPIXEL
  OR r9, r4, r1
  OR r0, r15, r1
  AND r7, r4, r1
  CMPI r14, 255
  DIV r28, r1, r5
  IKEY r5
  CMPI r5, 2
  JNZ r5, key_3
  FRAME
  JMP main_2
