; mixed program
; initialization
  LDI r5, 738
  LDI r6, 0x4A074D
  LDI r1, 255
  LDI r12, 0x406AD2
  LDI r15, 74
  LDI r6, 64
  STORE r6, r14
  LOAD r5, r6
  LDI r9, 0xBCAAD9
  STORE r9, r11
  LOAD r12, r9
  LDI r11, 16
  STORE r11, r6
  LOAD r14, r11
  LDI r11, 16
  STORE r11, r9
  LOAD r5, r11
  LDI r14, 3350
  STORE r14, r5
  LOAD r4, r14
  LDI r0, 2396
  STORE r0, r5
  LOAD r10, r0
  SHLI r4, r3, 1
  SHR r9, r15, r3
  SHL r5, r1, r15
  CMP r2, r5
  JZ r2, else_0
  SHL r2, r7, r14
  SHL r1, r0, r5
  JMP endif_1
else_0:
  LDI r8, 0x53CD7C
  FILL r8
  LDI r2, 10
  LDI r6, 256
  LDI r12, 16
  LDI r4, 0x85A397
  LDI r4, 0xE799A4
  RECTF r2, r6, r12, r4, r4
endif_1:
main_2:
  LDI r14, 910
  LDI r3, 2764
  LDI r5, 0x43AD38
  TEXT r14, r3, r5, "HELLO"
  IKEY r10
  CMPI r10, 0xBF131B
  JNZ r10, key_3
  ANDI r3, r9, 221
  IKEY r10
  CMPI r10, 0xEA4758
  JNZ r10, key_4
  OR r3, r1, r8
  OR r13, r8, r6
  XOR r2, r11, r8
  FRAME
  JMP main_2
