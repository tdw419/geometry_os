; conditional logic
; initialization
  LDI r3, 0xC17021
  LDI r22, 0x9BE7DA
  LDI r15, 0xD73005
  LDI r8, 0x68B370
  LDI r1, 2226
  LDI r13, 948
  CMP r6, r11
  JNZ r6, else_0
  OR r13, r7, r15
  JMP endif_1
else_0:
  LDI r13, 128
  LDI r15, 0x0A647E
  LDI r9, 0xA67902
  PSET r13, r15, r9
  LDI r3, 0xC36936
  FILL r3
  LDI r7, 2
  LDI r10, 128
  LDI r5, 8
  LDI r15, 0xDBD8FF
  LDI r10, 0xA10F82
  LINE r7, r10, r5, r15, r10
  LDI r9, 3284
  LDI r9, 0xDC170A
  LDI r5, 32
  WPIXEL
endif_1:
  HALT
