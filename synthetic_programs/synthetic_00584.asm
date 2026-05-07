; conditional logic
; initialization
  LDI r3, 2
  LDI r4, 256
  LDI r11, 1
  LDI r0, 3731
  LDI r15, 310
  LDI r20, 0x076152
  CMP r5, r15
  JNZ r5, else_0
  SHL r15, r14, r6
  SHL r9, r4, r3
  JMP endif_1
else_0:
  LDI r20, 0xD03CCB
  LDI r11, 128
  LDI r15, 0x9ABFFB
  PSETI
  LDI r9, 8
  LDI r10, 0x75DC3B
  LDI r19, 8
  LDI r6, 1011
  LDI r31, 3752
  RECTF r9, r10, r19, r6, r31
endif_1:
  CMP r3, r1
  JZ r3, else_2
  ADD r12, r10, r14
  XOR r11, r3, r12
  MUL r2, r13, r1
  JMP endif_3
else_2:
  LDI r30, 10
  LDI r6, 0
  LDI r15, 0xE58171
  LDI r1, 0x2F864A
  LDI r12, 0x487315
  RECTF r30, r6, r15, r1, r12
  LDI r5, 0x63A49C
  LDI r14, 2835
  LDI r13, 4
  LDI r24, 8
  CIRCLE r5, r14, r13, r24
endif_3:
  HALT
