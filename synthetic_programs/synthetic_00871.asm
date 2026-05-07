; input driven program
; initialization
  LDI r14, 1765
  LDI r4, 256
  LDI r9, 0xBD4076
main_0:
  IKEY r10
  CMPI r10, 0x990268
  JNZ r10, key_1
  OR r12, r2, r4
  AND r13, r6, r7
  OR r12, r8, r18
  CMP r14, r2
  LDI r0, 613
  LDI r2, 1138
  LDI r15, 0x8F6EE2
  LDI r14, 0xACDF38
  CIRCLE r0, r2, r15, r14
  OR r1, r11, r0
  LDI r6, 255
  FILL r6
  FRAME
  JMP main_0
