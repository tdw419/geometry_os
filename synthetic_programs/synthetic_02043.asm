; mixed program
; initialization
  LDI r2, 680
  LDI r9, 1741
  LDI r14, 16
  LDI r0, 255
  LDI r3, 255
  STORE r3, r5
  LOAD r14, r3
  LDI r1, 1350
  STORE r1, r15
  LOAD r12, r1
  CMP r1, r6
  JZ r1, else_0
  SHR r0, r9, r8
  MUL r0, r7, r6
  XOR r6, r14, r4
  SHR r0, r11, r5
  JMP endif_1
else_0:
  LDI r5, 0x7EE587
  LDI r14, 0x00AEDA
  LDI r7, 32
  LDI r1, 0x97AF0D
  LDI r8, 0xF6AA2B
  RECTF r5, r14, r7, r1, r8
endif_1:
  XOR r3, r4, r13
  AND r10, r12, r1
main_2:
  LDI r12, 128
  LDI r1, 0xA10C76
  LDI r0, 10
  DRAWTEXT r12, r1, r0, "WORLD"
  IKEY r24
  CMPI r24, 0xA33B72
  JNZ r24, key_3
  IKEY r6
  CMPI r6, 10
  JNZ r6, key_4
  OR r15, r0, r3
  OR r1, r4, r7
  XOR r6, r13, r20
  FRAME
  JMP main_2
