; conditional logic
; initialization
  LDI r4, 16
  LDI r11, 0x0A9946
  LDI r3, 3406
  LDI r8, 0x8794BD
  LDI r10, 0xBD4000
  CMP r2, r13
  JNZ r2, else_0
  SHR r5, r4, r1
  ADD r3, r14, r22
  JMP endif_1
else_0:
  LDI r7, 0xC5B6B2
  LDI r11, 1500
  LDI r10, 1799
  LDI r0, 0xA0CCA3
  LDI r22, 0x9A62F9
  RECTF r7, r11, r10, r0, r22
  LDI r15, 128
  LDI r4, 128
  LDI r10, 2
  LDI r4, 2548
  LDI r3, 64
  LINE r15, r4, r10, r4, r3
endif_1:
  CMP r5, r4
  JNZ r5, else_2
  OR r10, r13, r4
  AND r10, r14, r3
  XOR r12, r4, r2
  JMP endif_3
else_2:
  LDI r1, 32
  FILL r1
endif_3:
  CMP r12, r0
  JNZ r12, else_4
  OR r9, r4, r0
  SUB r12, r9, r11
  XOR r13, r4, r3
  JMP endif_5
else_4:
  LDI r14, 2364
  LDI r1, 0x730DC3
  LDI r4, 3539
  LDI r1, 0xFAB2ED
  CIRCLE r14, r1, r4, r1
  LDI r8, 255
  LDI r14, 8
  LDI r13, 0x47264A
  PSET r8, r14, r13
  LDI r11, 0x7C1EEB
  LDI r0, 0x97A8FE
  LDI r10, 2939
  WPIXEL
endif_5:
  HALT
