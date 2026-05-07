; conditional logic
; initialization
  LDI r14, 2326
  LDI r1, 0x524811
  LDI r11, 10
  LDI r15, 16
  LDI r2, 0x8FD9B5
  CMP r10, r4
  JZ r10, else_0
  MUL r15, r10, r3
  JMP endif_1
else_0:
  LDI r11, 0xE0F342
  LDI r5, 2420
  LDI r6, 0x76BF45
  WPIXEL
  LDI r8, 10
  LDI r8, 16
  LDI r15, 0x64ECD7
  LDI r11, 64
  CIRCLE r8, r8, r15, r11
endif_1:
  HALT
