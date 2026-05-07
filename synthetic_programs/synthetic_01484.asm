; input driven program
; initialization
  LDI r0, 2347
  LDI r15, 3814
  LDI r3, 0x430F64
  LDI r9, 0x0BDCB1
  LDI r12, 255
  LDI r29, 2
main_0:
  CMP r10, r12
  AND r13, r6, r14
  XOR r1, r8, r2
  IKEY r10
  CMPI r10, 256
  JNZ r10, key_1
  OR r3, r2, r9
  XOR r8, r14, r6
  OR r9, r11, r13
  CMPI r3, 0xC78C51
  FRAME
  JMP main_0
