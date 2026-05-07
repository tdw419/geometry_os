; input driven program
; initialization
  LDI r5, 0xDBF501
  LDI r27, 0x5DB852
  LDI r9, 128
  LDI r8, 4
main_0:
  LDI r7, 1
  LDI r1, 128
  LDI r14, 32
  PSET r7, r1, r14
  IKEY r8
  CMPI r8, 97
  JNZ r8, key_1
  OR r7, r3, r1
  AND r3, r9, r6
  FRAME
  JMP main_0
