; conditional logic
; initialization
  LDI r5, 1059
  LDI r12, 0xBAEC8E
  LDI r6, 16
  LDI r3, 32
  LDI r11, 64
  LDI r2, 0x35ADCA
  LDI r15, 2942
  LDI r4, 32
  CMP r11, r7
  JNZ r11, else_0
  SHR r8, r14, r3
  SHR r11, r5, r3
  JMP endif_1
else_0:
  LDI r13, 1085
  LDI r2, 337
  LDI r8, 2906
  LDI r0, 922
  LDI r7, 10
  RECTF r13, r2, r8, r0, r7
  LDI r0, 10
  LDI r10, 256
  LDI r7, 2981
  LDI r7, 0x4FB74E
  LDI r5, 0x91ECE0
  LINE r0, r10, r7, r7, r5
endif_1:
  CMP r1, r5
  JNZ r1, else_2
  ADD r3, r4, r15
  JMP endif_3
else_2:
  LDI r13, 255
  LDI r8, 255
  LDI r9, 3672
  PSET r13, r8, r9
  LDI r0, 105
  LDI r7, 2432
  LDI r2, 3752
  PSET r0, r7, r2
  LDI r15, 8
  FILL r15
endif_3:
  CMP r0, r6
  JNZ r0, else_4
  MUL r9, r8, r10
  JMP endif_5
else_4:
  LDI r1, 256
  FILL r1
  LDI r5, 64
  LDI r4, 10
  LDI r1, 0
  WPIXEL
endif_5:
  HALT
