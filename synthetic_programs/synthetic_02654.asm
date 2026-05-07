; input driven program
; initialization
  LDI r7, 1188
  LDI r5, 203
main_0:
  OR r15, r13, r11
  AND r15, r9, r12
  AND r8, r0, r3
  SAR r8, r13, r11
  SHLI r0, r6, 2
  AND r15, r13, r5
  IKEY r8
  CMPI r8, 8
  JNZ r8, key_1
  IKEY r14
  CMPI r14, 0x165FDC
  JNZ r14, key_2
  FRAME
  JMP main_0
