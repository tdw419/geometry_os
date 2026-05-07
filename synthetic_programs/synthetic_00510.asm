; mixed program
; initialization
  LDI r7, 584
  LDI r10, 0xED7609
  LDI r14, 0
  LDI r3, 255
  LDI r28, 0xA78041
  LDI r4, 128
  LDI r8, 255
  OR r14, r6, r4
  XOR r9, r4, r21
  CMP r21, r12
  JNZ r21, else_0
  ADD r0, r2, r10
  OR r12, r2, r0
  DIV r11, r1, r0
  JMP endif_1
else_0:
  LDI r15, 859
  LDI r13, 0x8BF887
  LDI r6, 3482
  LDI r23, 4
  CIRCLE r15, r13, r6, r23
  LDI r3, 0xFFBCBC
  LDI r14, 0x2131AF
  LDI r12, 0x0365A3
  LDI r3, 64
  CIRCLE r3, r14, r12, r3
  LDI r15, 0xA73C85
  FILL r15
endif_1:
  CMP r1, r6
  JZ r1, else_2
  SUB r1, r0, r11
  SHL r11, r3, r14
  OR r1, r5, r8
  MUL r11, r8, r6
  JMP endif_3
else_2:
  LDI r6, 0x2AE322
  LDI r9, 0x03B83E
  LDI r6, 0x087F28
  PSET r6, r9, r6
  LDI r2, 0x47814D
  LDI r29, 8
  LDI r15, 32
  LDI r7, 0x342F9B
  LDI r0, 255
  RECTF r2, r29, r15, r7, r0
endif_3:
  PUSH r15
  SHR r9, r6, r11
  AND r7, r2, r1
  DIV r12, r6, r15
  SHL r0, r7, r11
  SUB r3, r15, r9
  POP r15
  LDI r7, 2876
  STORE r7, r0
  LOAD r4, r7
  LDI r4, 0x709A55
  STORE r4, r0
  LOAD r15, r4
  LDI r2, 0x5F7216
  STORE r2, r14
  LOAD r11, r2
  LDI r8, 255
  STORE r8, r1
  LOAD r4, r8
  LDI r9, 0x5556EB
  STORE r9, r7
  LOAD r1, r9
  IKEY r5
  CMPI r5, 4
  JNZ r5, key_4
  MUL r0, r15, r14
  LDI r5, 4
  STORE r5, r7
  LOAD r3, r5
  LDI r15, 0x764673
  STORE r15, r4
  LOAD r13, r15
  LDI r1, 4015
  STORE r1, r7
  LOAD r12, r1
  HALT
