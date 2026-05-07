; conditional logic
; initialization
  LDI r8, 4
  LDI r23, 455
  LDI r2, 0x2E2B26
  LDI r13, 2006
  LDI r12, 2664
  LDI r31, 407
  LDI r1, 0xC6C00B
  CMP r4, r6
  JZ r4, else_0
  MUL r12, r11, r4
  SHR r22, r8, r2
  MUL r14, r4, r10
  JMP endif_1
else_0:
  LDI r4, 128
  LDI r7, 10
  LDI r11, 256
  LDI r15, 64
  CIRCLE r4, r7, r11, r15
  LDI r12, 0xAE92C6
  LDI r2, 0x4F3C9C
  LDI r12, 3998
  PSET r12, r2, r12
endif_1:
  CMP r14, r2
  JZ r14, else_2
  DIV r31, r1, r15
  SHL r4, r10, r14
  MUL r3, r10, r30
  SHL r15, r0, r5
  JMP endif_3
else_2:
  LDI r11, 72
  LDI r14, 0xBEDC03
  LDI r9, 0x62D024
  LDI r11, 621
  LDI r5, 2246
  RECTF r11, r14, r9, r11, r5
  LDI r7, 0x6C6233
  LDI r5, 0x387526
  LDI r0, 10
  LDI r2, 255
  LDI r10, 3531
  LINE r7, r5, r0, r2, r10
  LDI r15, 0x5B55CA
  LDI r15, 1923
  LDI r5, 256
  WPIXEL
endif_3:
  HALT
