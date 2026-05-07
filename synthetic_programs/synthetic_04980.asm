; input driven program
; initialization
  LDI r12, 2291
  LDI r15, 0xA95645
  LDI r9, 0x7F7AB8
  LDI r10, 2849
  LDI r13, 663
  LDI r4, 2
  LDI r2, 1166
main_0:
  LDI r3, 1439
  LDI r13, 3733
  LDI r3, 10
  DRAWTEXT r3, r13, r3, "WORLD"
  CMP r2, r12
  AND r4, r9, r14
  OR r13, r15, r1
  AND r5, r15, r2
  SHL r14, r13, r1
  SAR r8, r11, r13
  SHLI r10, r9, 0x51AD7C
  IKEY r6
  CMPI r6, 0x6D8595
  JNZ r6, key_1
  IKEY r10
  CMPI r10, 0xEE853B
  JNZ r10, key_2
  FRAME
  JMP main_0
