; input driven program
; initialization
  LDI r8, 255
  LDI r13, 10
  LDI r0, 0x43FD77
  LDI r3, 128
  LDI r6, 64
  LDI r14, 2678
main_0:
  SHL r6, r10, r15
  XOR r13, r19, r15
  OR r4, r1, r8
  OR r10, r5, r9
  AND r5, r2, r0
  LDI r3, 0x6E0445
  LDI r1, 1
  LDI r10, 0x7EEEA0
  WPIXEL
  IKEY r6
  CMPI r6, 8
  JNZ r6, key_1
  FRAME
  JMP main_0
