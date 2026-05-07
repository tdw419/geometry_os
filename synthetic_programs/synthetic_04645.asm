; conditional logic
; initialization
  LDI r8, 128
  LDI r11, 2565
  LDI r1, 3602
  LDI r12, 3848
  LDI r3, 32
  LDI r6, 2714
  LDI r2, 0xB121B5
  LDI r13, 0x8ECAB3
  CMP r13, r2
  JZ r13, else_0
  MUL r2, r12, r9
  SHR r10, r6, r15
  MOD r15, r4, r5
  XOR r13, r9, r8
  JMP endif_1
else_0:
  LDI r4, 3470
  LDI r4, 0
  LDI r7, 256
  WPIXEL
  LDI r8, 0x3F105E
  LDI r4, 3933
  LDI r6, 128
  LDI r14, 0xCB99C8
  LDI r23, 0x792CFD
  RECTF r8, r4, r6, r14, r23
  LDI r4, 16
  FILL r4
endif_1:
  CMP r13, r10
  JNZ r13, else_2
  XOR r5, r1, r2
  JMP endif_3
else_2:
  LDI r3, 0
  LDI r5, 330
  LDI r3, 3647
  LDI r15, 16
  LDI r3, 597
  RECTF r3, r5, r3, r15, r3
  LDI r1, 459
  LDI r31, 0
  LDI r15, 0xCCC8F0
  PSET r1, r31, r15
  LDI r3, 0xE28E07
  LDI r4, 0x564F51
  LDI r31, 1820
  LDI r0, 1
  LDI r28, 1867
  RECTF r3, r4, r31, r0, r28
endif_3:
  HALT
