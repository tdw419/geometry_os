; conditional logic
; initialization
  LDI r15, 0
  LDI r0, 0x6A2673
  LDI r10, 10
  LDI r5, 356
  LDI r1, 1614
  LDI r11, 0xF3A6B8
  LDI r13, 32
  LDI r12, 1368
  CMP r29, r6
  JZ r29, else_0
  MOD r1, r13, r4
  SHL r4, r14, r3
  JMP endif_1
else_0:
  LDI r10, 256
  LDI r12, 8
  LDI r2, 0xD01C42
  WPIXEL
  LDI r13, 894
  FILL r13
  LDI r13, 4084
  FILL r13
endif_1:
  HALT
