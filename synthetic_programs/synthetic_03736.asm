; mixed program
; initialization
  LDI r9, 256
  LDI r1, 1
  LDI r5, 2121
  LDI r10, 0x83BB9C
  LDI r12, 3659
  LDI r20, 8
  LDI r8, 0x5B603C
  LDI r7, 2922
  IKEY r11
  CMPI r11, 1
  JNZ r11, key_0
  XOR r15, r12, r14
  IKEY r14
  CMPI r14, 189
  JNZ r14, key_1
  IKEY r2
  CMPI r2, 128
  JNZ r2, key_2
  LDI r14, 0xC24544
  LDI r15, 1946
  LDI r7, 64
  PSETI
  SHL r1, r5, r11
  SAR r15, r10, r6
  SHR r9, r10, r15
  LDI r2, 256
  LDI r6, 0x2E623F
  LDI r12, 0xE0640D
  TEXT r2, r6, r12, "HELLO"
  AND r4, r22, r13
  OR r2, r7, r4
  XOR r9, r1, r7
  AND r10, r9, r15
main_3:
  LDI r15, 0x88E145
  LDI r4, 150
  LDI r7, 0x6DCF08
  TEXT r15, r4, r7, "HELLO"
  LDI r8, 1706
  LDI r3, 10
  LDI r7, 256
  LDI r5, 8
  CIRCLE r8, r3, r7, r5
  FRAME
  JMP main_3
