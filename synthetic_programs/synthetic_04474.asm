; mixed program
; initialization
  LDI r2, 606
  LDI r24, 0x7BA720
  LDI r12, 3891
  LDI r4, 0xE6D4FA
  LDI r0, 0x3CC7C7
  LDI r10, 2257
  LDI r20, 256
  CMP r30, r8
  JNZ r30, else_0
  SHR r1, r11, r3
  OR r10, r5, r4
  JMP endif_1
else_0:
  LDI r6, 0
  LDI r3, 1546
  LDI r4, 0xA52C76
  LDI r2, 1541
  LDI r12, 0x26BAED
  LINE r6, r3, r4, r2, r12
  LDI r1, 256
  LDI r9, 4
  LDI r5, 0xE95CA2
  WPIXEL
endif_1:
  LDI r11, 3052
  LDI r1, 1
  LDI r2, 2648
  WPIXEL
  CMPI r1, 180
  IKEY r0
  CMPI r0, 0x953AC7
  JNZ r0, key_2
  HALT
