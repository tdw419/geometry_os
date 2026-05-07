; input driven program
; initialization
  LDI r5, 32
  LDI r3, 0xFC84E0
  LDI r7, 1123
  LDI r4, 1468
  LDI r2, 0x0B5982
  LDI r9, 0x39BAEF
  LDI r6, 4
main_0:
  IKEY r6
  CMPI r6, 223
  JNZ r6, key_1
  IKEY r12
  CMPI r12, 16
  JNZ r12, key_2
  MOD r3, r6, r13
  IKEY r3
  CMPI r3, 0xFDB9D1
  JNZ r3, key_3
  XOR r3, r7, r15
  LDI r4, 0x5C4EE7
  LDI r12, 1504
  LDI r7, 255
  PSET r4, r12, r7
  FRAME
  JMP main_0
