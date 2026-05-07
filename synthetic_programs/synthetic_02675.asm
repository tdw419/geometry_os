; mixed program
; initialization
  LDI r18, 10
  LDI r20, 1311
  LDI r0, 1521
  LDI r2, 0xD9D7AE
  LDI r3, 0x0CFBC0
  LDI r31, 1633
  LDI r9, 0xA6FAF7
  LDI r10, 1048
  DIV r1, r9, r13
  LDI r2, 10
  LDI r8, 0x50DE58
  LDI r3, 803
  TEXT r2, r8, r3, "HELLO"
  LDI r25, 15
loop_0:
  ADDI r12, r10, 95
  AND r4, r11, r5
  LDI r5, 1
  SUB r25, r25, r5
  JNZ r25, loop_0
  IKEY r2
  CMPI r2, 243
  JNZ r2, key_1
  CMP r26, r9
  OR r1, r0, r3
  XOR r18, r6, r11
  AND r3, r6, r11
  OR r5, r14, r7
  LDI r20, 0x014FF7
  LDI r9, 0xEA01C4
  LDI r4, 0x7C00DB
  WPIXEL
  HALT
