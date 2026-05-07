; conditional logic
; initialization
  LDI r11, 16
  LDI r7, 0x576E98
  LDI r0, 0xC01408
  LDI r12, 2
  LDI r2, 2727
  LDI r9, 256
  CMP r20, r6
  JNZ r20, else_0
  ADD r15, r3, r0
  JMP endif_1
else_0:
  LDI r13, 0xA8952A
  LDI r14, 2753
  LDI r2, 0
  WPIXEL
  LDI r7, 8
  LDI r29, 64
  LDI r0, 0x3C49B9
  PSETI
  LDI r11, 64
  FILL r11
  LDI r11, 772
  LDI r2, 2185
  LDI r9, 10
  LDI r7, 0x64074F
  LDI r10, 3974
  LINE r11, r2, r9, r7, r10
endif_1:
  HALT
