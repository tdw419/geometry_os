; conditional logic
; initialization
  LDI r10, 10
  LDI r9, 0xD006CF
  LDI r8, 255
  LDI r13, 1894
  LDI r1, 0xC35B36
  CMP r9, r6
  JNZ r9, else_0
  MUL r7, r10, r13
  OR r1, r6, r15
  SHL r0, r11, r14
  JMP endif_1
else_0:
  LDI r7, 0x093082
  LDI r0, 1085
  LDI r6, 0
  PSET r7, r0, r6
  LDI r3, 1163
  LDI r8, 0x2C9440
  LDI r7, 0xDCEE54
  LDI r8, 2
  CIRCLE r3, r8, r7, r8
  LDI r5, 0x595424
  LDI r2, 1
  LDI r11, 4
  PSETI
  LDI r2, 870
  LDI r7, 0xFD4CD1
  LDI r28, 64
  WPIXEL
endif_1:
  CMP r10, r0
  JZ r10, else_2
  ADD r9, r10, r8
  JMP endif_3
else_2:
  LDI r2, 1481
  LDI r11, 32
  LDI r0, 0xDD0A57
  LDI r4, 2884
  CIRCLE r2, r11, r0, r4
endif_3:
  HALT
