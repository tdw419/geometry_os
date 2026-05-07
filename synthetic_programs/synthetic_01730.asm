; input driven program
; initialization
  LDI r3, 0x171CFA
  LDI r15, 3101
  LDI r5, 0x580613
  LDI r11, 34
  LDI r7, 3071
  LDI r4, 10
  LDI r13, 2
main_0:
  OR r14, r5, r2
  XOR r10, r8, r29
  AND r4, r11, r9
  XOR r3, r2, r5
  SUBI r8, r9, 186
  SHLI r13, r9, 1
  SHLI r15, r9, 0x127485
  SAR r8, r12, r1
  SHLI r4, r7, 1
  MOD r11, r6, r8
  IKEY r20
  CMPI r20, 32
  JNZ r20, key_1
  FRAME
  JMP main_0
