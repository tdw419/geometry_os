; conditional logic
; initialization
  LDI r6, 3461
  LDI r12, 3974
  LDI r1, 0x91394A
  LDI r14, 0x7DD31C
  LDI r10, 0xBEA549
  LDI r11, 255
  CMP r11, r0
  JNZ r11, else_0
  AND r7, r14, r4
  JMP endif_1
else_0:
  LDI r8, 0x39EB58
  LDI r5, 8
  LDI r9, 0x66FE3D
  PSETI
  LDI r6, 255
  LDI r13, 1804
  LDI r3, 10
  LDI r13, 0x7527BC
  LDI r15, 2
  LINE r6, r13, r3, r13, r15
endif_1:
  CMP r6, r8
  JZ r6, else_2
  SHR r12, r11, r13
  AND r22, r1, r13
  JMP endif_3
else_2:
  LDI r0, 287
  LDI r10, 2877
  LDI r1, 128
  LDI r6, 1284
  LDI r3, 1
  LINE r0, r10, r1, r6, r3
endif_3:
  HALT
