; input driven program
; initialization
  LDI r7, 0x924182
  LDI r14, 2620
  LDI r12, 4
  LDI r2, 0xA0D409
  LDI r0, 562
  LDI r13, 64
main_0:
  OR r1, r15, r11
  XOR r4, r3, r6
  AND r15, r14, r13
  AND r5, r1, r7
  IKEY r7
  CMPI r7, 0x1A7BB2
  JNZ r7, key_1
  CMPI r0, 1
  CMP r14, r12
  CMP r5, r9
  CMPI r2, r5, 0x9C2535
  FRAME
  JMP main_0
