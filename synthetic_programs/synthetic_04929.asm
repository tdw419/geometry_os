; conditional logic
; initialization
  LDI r11, 1817
  LDI r10, 3442
  LDI r4, 1
  LDI r3, 128
  LDI r0, 857
  LDI r12, 0
  LDI r15, 2133
  CMP r14, r8
  JNZ r14, else_0
  XOR r7, r24, r12
  JMP endif_1
else_0:
  LDI r7, 1
  LDI r14, 1
  LDI r12, 256
  LDI r4, 908
  CIRCLE r7, r14, r12, r4
  LDI r12, 3976
  LDI r3, 0x776C29
  LDI r14, 16
  PSET r12, r3, r14
  LDI r8, 2295
  LDI r0, 486
  LDI r31, 8
  PSETI
endif_1:
  CMP r14, r3
  JNZ r14, else_2
  AND r1, r14, r9
  JMP endif_3
else_2:
  LDI r13, 3447
  LDI r6, 0x9E71FD
  LDI r10, 0x0E47CC
  LDI r3, 0x0AD858
  LDI r12, 0x9490AF
  RECTF r13, r6, r10, r3, r12
  LDI r12, 0x74474D
  LDI r10, 1748
  LDI r0, 0x9A6F70
  LDI r11, 1604
  CIRCLE r12, r10, r0, r11
  LDI r1, 3475
  LDI r9, 2993
  LDI r10, 0xFE6A29
  LDI r7, 0xB1428B
  CIRCLE r1, r9, r10, r7
  LDI r2, 0x16D353
  LDI r13, 16
  LDI r11, 64
  LDI r13, 2
  CIRCLE r2, r13, r11, r13
endif_3:
  CMP r12, r5
  JNZ r12, else_4
  MOD r14, r4, r1
  SHR r4, r3, r10
  XOR r0, r10, r9
  MOD r7, r1, r10
  JMP endif_5
else_4:
  LDI r0, 2025
  LDI r8, 4066
  LDI r1, 0xD5B753
  LDI r4, 0xAFD677
  LDI r15, 0x24E696
  RECTF r0, r8, r1, r4, r15
  LDI r6, 0xCA9EF0
  LDI r7, 1484
  LDI r12, 0xF2D422
  PSET r6, r7, r12
  LDI r1, 1159
  LDI r6, 3875
  LDI r6, 2751
  WPIXEL
endif_5:
  HALT
