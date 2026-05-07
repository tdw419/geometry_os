; conditional logic
; initialization
  LDI r9, 64
  LDI r11, 405
  CMP r2, r7
  JNZ r2, else_0
  SUB r1, r12, r7
  JMP endif_1
else_0:
  LDI r5, 256
  LDI r7, 2791
  LDI r7, 2
  PSETI
  LDI r15, 0xDF4219
  LDI r2, 16
  LDI r2, 2145
  LDI r4, 16
  CIRCLE r15, r2, r2, r4
endif_1:
  CMP r9, r3
  JZ r9, else_2
  ADD r6, r12, r8
  DIV r12, r10, r13
  SHR r15, r9, r4
  JMP endif_3
else_2:
  LDI r5, 0x76125C
  LDI r10, 0x373878
  LDI r11, 0xCC2586
  PSET r5, r10, r11
  LDI r3, 2201
  LDI r3, 1137
  LDI r6, 2313
  PSET r3, r3, r6
endif_3:
  CMP r10, r8
  JNZ r10, else_4
  MUL r10, r23, r0
  JMP endif_5
else_4:
  LDI r6, 8
  LDI r0, 1107
  LDI r10, 255
  PSETI
  LDI r20, 255
  LDI r8, 0xC2B64D
  LDI r5, 1
  LDI r7, 0
  LDI r15, 0xA0B5BB
  LINE r20, r8, r5, r7, r15
  LDI r5, 2
  LDI r11, 3064
  LDI r13, 2592
  WPIXEL
  LDI r8, 0xCE1FC0
  LDI r6, 0x7C43F7
  LDI r21, 0xC34E93
  PSETI
endif_5:
  HALT
