; conditional logic
; initialization
  LDI r22, 2476
  LDI r14, 0xEAAAF4
  CMP r10, r3
  JNZ r10, else_0
  XOR r8, r0, r5
  OR r0, r5, r1
  MUL r14, r12, r1
  JMP endif_1
else_0:
  LDI r8, 64
  LDI r7, 0x6141A2
  LDI r1, 64
  WPIXEL
endif_1:
  CMP r15, r3
  JNZ r15, else_2
  DIV r14, r0, r6
  ADD r12, r11, r0
  SHL r3, r6, r9
  SHR r1, r15, r0
  JMP endif_3
else_2:
  LDI r13, 255
  LDI r6, 1006
  LDI r8, 8
  LDI r1, 10
  LDI r28, 8
  LINE r13, r6, r8, r1, r28
endif_3:
  CMP r12, r4
  JZ r12, else_4
  XOR r15, r13, r5
  MUL r0, r6, r9
  AND r8, r15, r9
  JMP endif_5
else_4:
  LDI r11, 2672
  LDI r7, 32
  LDI r4, 0xB2057E
  PSETI
  LDI r1, 0x7F8EDD
  LDI r5, 556
  LDI r15, 0x494FB9
  LDI r14, 8
  LDI r7, 2631
  RECTF r1, r5, r15, r14, r7
  LDI r5, 255
  LDI r4, 16
  LDI r10, 3675
  LDI r10, 386
  LDI r2, 0xE880D8
  LINE r5, r4, r10, r10, r2
endif_5:
  HALT
