; conditional logic
; initialization
  LDI r15, 0
  LDI r3, 2140
  LDI r5, 503
  LDI r1, 0
  LDI r12, 3619
  LDI r4, 3394
  CMP r5, r14
  JNZ r5, else_0
  AND r11, r3, r2
  AND r10, r11, r3
  SUB r11, r3, r13
  MUL r5, r0, r11
  JMP endif_1
else_0:
  LDI r9, 255
  LDI r13, 0x4D3C6C
  LDI r12, 3920
  PSET r9, r13, r12
  LDI r7, 1
  FILL r7
  LDI r13, 3834
  LDI r3, 0x0BAA82
  LDI r8, 10
  WPIXEL
endif_1:
  HALT
