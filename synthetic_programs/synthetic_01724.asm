; conditional logic
; initialization
  LDI r11, 255
  LDI r0, 256
  LDI r8, 201
  LDI r5, 1792
  LDI r4, 0x19B00E
  LDI r9, 1744
  LDI r10, 3271
  LDI r21, 0x058399
  CMP r1, r11
  JZ r1, else_0
  ADD r12, r8, r13
  XOR r2, r5, r11
  JMP endif_1
else_0:
  LDI r5, 2229
  LDI r7, 138
  LDI r7, 0x254923
  LDI r26, 0
  CIRCLE r5, r7, r7, r26
  LDI r15, 197
  LDI r13, 128
  LDI r17, 2475
  WPIXEL
endif_1:
  CMP r7, r1
  JZ r7, else_2
  XOR r10, r14, r7
  XOR r6, r28, r20
  JMP endif_3
else_2:
  LDI r3, 1
  LDI r2, 3403
  LDI r5, 1210
  LDI r6, 420
  CIRCLE r3, r2, r5, r6
  LDI r7, 0x2AED65
  LDI r14, 0x307581
  LDI r4, 0x43985C
  LDI r14, 16
  LDI r10, 1621
  LINE r7, r14, r4, r14, r10
  LDI r0, 2327
  FILL r0
  LDI r14, 0xAE5292
  LDI r12, 1
  LDI r14, 0xACFD3C
  LDI r14, 0x3D0EAB
  CIRCLE r14, r12, r14, r14
endif_3:
  CMP r8, r3
  JNZ r8, else_4
  SHL r14, r15, r12
  ADD r15, r2, r7
  DIV r15, r1, r8
  DIV r2, r10, r14
  JMP endif_5
else_4:
  LDI r4, 3406
  LDI r15, 256
  LDI r15, 0x7908A3
  WPIXEL
endif_5:
  HALT
