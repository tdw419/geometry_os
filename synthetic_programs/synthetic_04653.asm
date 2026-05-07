; input driven program
; initialization
  LDI r6, 0x5E33CE
  LDI r10, 0x572616
  LDI r13, 1094
  LDI r1, 903
  LDI r12, 0x3C5258
  LDI r25, 0xA146E1
  LDI r11, 8
  LDI r15, 2617
main_0:
  SAR r3, r2, r15
  SAR r6, r9, r2
  SAR r15, r4, r14
  SHL r1, r10, r11
  XOR r4, r9, r7
  AND r4, r5, r6
  IKEY r7
  CMPI r7, 0x5DC87D
  JNZ r7, key_1
  XOR r12, r15, r3
  XOR r4, r5, r3
  XOR r2, r14, r0
  OR r12, r8, r1
  CMPI r12, r6, 0xAFEA5D
  ANDI r1, r3, 64
  FRAME
  JMP main_0
