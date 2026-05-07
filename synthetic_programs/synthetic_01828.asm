; mixed program
; initialization
  LDI r2, 0x57C38D
  LDI r6, 256
  LDI r24, 2056
  LDI r5, 0x9B9C6F
  LDI r0, 2
  IKEY r12
  CMPI r12, 0xAFF2F6
  JNZ r12, key_0
  CMPI r1, 42
  LDI r0, 0x402F44
  LDI r13, 3744
  LDI r8, 0x5C61B4
  DRAWTEXT r0, r13, r8, "WORLD"
  LDI r12, 0x1C80B3
  LDI r6, 256
  LDI r7, 1959
  LDI r14, 531
  CIRCLE r12, r6, r7, r14
main_1:
  SAR r15, r6, r0
  SHLI r7, r10, 128
  SAR r3, r5, r6
  SAR r14, r17, r6
  OR r3, r4, r0
  OR r3, r14, r1
  CMPI r0, 96
  IKEY r6
  CMPI r6, 255
  JNZ r6, key_2
  IKEY r1
  CMPI r1, 2
  JNZ r1, key_3
  FRAME
  JMP main_1
