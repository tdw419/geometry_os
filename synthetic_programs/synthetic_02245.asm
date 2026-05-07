; input driven program
; initialization
  LDI r11, 0
  LDI r30, 3631
  LDI r14, 3173
  LDI r21, 1206
main_0:
  IKEY r12
  CMPI r12, 8
  JNZ r12, key_1
  XOR r2, r12, r9
  XOR r14, r19, r15
  OR r4, r7, r6
  OR r6, r10, r2
  AND r0, r5, r11
  LDI r25, 1064
  LDI r15, 0
  LDI r3, 0xDA9E42
  TEXT r25, r15, r3, "HELLO"
  LDI r4, 0xE62F9C
  LDI r6, 0x6E9AD3
  LDI r9, 0x4A5EBE
  PSETI
  FRAME
  JMP main_0
