; conditional logic
; initialization
  LDI r1, 2124
  LDI r7, 10
  LDI r15, 3968
  LDI r6, 256
  LDI r3, 2
  LDI r14, 16
  LDI r5, 8
  LDI r31, 0x7FBBA5
  CMP r15, r11
  JZ r15, else_0
  OR r14, r1, r2
  SHR r1, r11, r6
  XOR r12, r14, r2
  XOR r21, r10, r5
  JMP endif_1
else_0:
  LDI r10, 256
  LDI r4, 3369
  LDI r9, 3836
  WPIXEL
endif_1:
  HALT
