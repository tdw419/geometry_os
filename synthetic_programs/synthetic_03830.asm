; conditional logic
; initialization
  LDI r7, 0x18EC2F
  LDI r1, 32
  CMP r11, r5
  JZ r11, else_0
  ADD r4, r6, r14
  XOR r2, r23, r1
  JMP endif_1
else_0:
  LDI r5, 1047
  LDI r9, 255
  LDI r12, 511
  PSET r5, r9, r12
  LDI r9, 256
  LDI r9, 3183
  LDI r21, 3091
  LDI r10, 0xB10CB9
  CIRCLE r9, r9, r21, r10
endif_1:
  CMP r0, r15
  JNZ r0, else_2
  MUL r4, r15, r11
  SHL r8, r4, r1
  SUB r14, r3, r5
  MUL r12, r8, r11
  JMP endif_3
else_2:
  LDI r7, 2589
  LDI r2, 16
  LDI r15, 1448
  WPIXEL
endif_3:
  HALT
