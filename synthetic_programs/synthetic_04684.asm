; mixed program
; initialization
  LDI r31, 2290
  LDI r7, 0xF969F3
  LDI r2, 0x9E4F21
  LDI r9, 0xC392B2
  CMPI r9, 80
  SHR r4, r24, r15
  SAR r16, r1, r3
  SAR r10, r7, r3
  SHLI r12, r10, 0x93AEEC
  SAR r1, r11, r12
  CMP r3, r14
  LDI r4, 10
  STORE r4, r7
  LOAD r1, r4
  LDI r5, 0x3CA6C1
  STORE r5, r9
  LOAD r4, r5
  LDI r11, 0x7F8B7E
  STORE r11, r3
  LOAD r9, r11
  LDI r12, 0x01FE0B
  STORE r12, r15
  LOAD r10, r12
  PUSH r3
  AND r6, r18, r7
  SHR r6, r5, r4
  MOD r8, r7, r11
  DIV r6, r23, r11
  XOR r7, r2, r21
  POP r3
  LDI r7, 0x05D914
  STORE r7, r15
  LOAD r10, r7
  LDI r11, 64
  STORE r11, r7
  LOAD r9, r11
  LDI r1, 0x676D6B
  STORE r1, r7
  LOAD r11, r1
  XOR r15, r10, r0
  AND r2, r14, r15
  XOR r6, r13, r8
main_0:
  LDI r12, 8
  LDI r12, 16
  LDI r5, 0xFCAC2E
  LDI r2, 0x5A1306
  LDI r4, 16
  RECTF r12, r12, r5, r2, r4
  CMPI r26, r0, 138
  LDI r22, 10
  LDI r6, 255
  LDI r15, 0xB736A6
  TEXT r22, r6, r15, "HELLO"
  CMPI r9, 0x514464
  FRAME
  JMP main_0
