; conditional logic
; initialization
  LDI r2, 1
  LDI r15, 4
  LDI r6, 0xA3A123
  LDI r13, 1004
  LDI r11, 2203
  CMP r13, r7
  JNZ r13, else_0
  ADD r2, r5, r3
  MUL r13, r10, r8
  ADD r3, r13, r30
  JMP endif_1
else_0:
  LDI r1, 3036
  LDI r4, 1
  LDI r1, 0xB33E56
  PSETI
  LDI r14, 255
  LDI r14, 652
  LDI r3, 0x9BCE68
  LDI r1, 1563
  LDI r3, 2
  LINE r14, r14, r3, r1, r3
  LDI r11, 3859
  LDI r0, 0xDE395D
  LDI r9, 0x8FCF64
  PSETI
  LDI r11, 4005
  FILL r11
endif_1:
  HALT
