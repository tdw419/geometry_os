; conditional logic
; initialization
  LDI r8, 255
  LDI r2, 255
  LDI r13, 4
  LDI r3, 0xC677B1
  LDI r11, 0x156367
  LDI r10, 255
  LDI r15, 0xC06637
  CMP r3, r11
  JNZ r3, else_0
  XOR r14, r12, r5
  OR r0, r15, r10
  JMP endif_1
else_0:
  LDI r10, 0x73E575
  LDI r10, 0xA273CA
  LDI r3, 0x190627
  PSETI
  LDI r10, 10
  LDI r13, 2
  LDI r5, 0x7E7467
  WPIXEL
  LDI r13, 3017
  LDI r15, 255
  LDI r6, 64
  LDI r0, 1368
  LDI r6, 128
  LINE r13, r15, r6, r0, r6
endif_1:
  HALT
