; input driven program
; initialization
  LDI r6, 0
  LDI r15, 255
  LDI r12, 2934
  LDI r0, 1
  LDI r10, 0x7212F4
  LDI r5, 783
main_0:
  SHLI r0, r7, 1
  SHR r4, r10, r6
  SAR r0, r23, r1
  SHL r11, r0, r8
  OR r17, r11, r13
  XOR r7, r0, r5
  AND r15, r6, r12
  XOR r11, r1, r2
  LDI r9, 0xD35165
  LDI r4, 0x94164E
  LDI r8, 2597
  DRAWTEXT r9, r4, r8, "WORLD"
  IKEY r0
  CMPI r0, 0xD199AF
  JNZ r0, key_1
  CMPI r8, 8
  LDI r1, 1930
  LDI r0, 0x73C994
  LDI r9, 64
  TEXT r1, r0, r9, "HELLO"
  FRAME
  JMP main_0
