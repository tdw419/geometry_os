; input driven program
; initialization
  LDI r14, 0x459E9E
  LDI r9, 10
  LDI r0, 0x7049F7
  LDI r6, 64
  LDI r3, 4010
  LDI r1, 0x7ED0C0
  LDI r15, 3989
  LDI r11, 0x53DA90
main_0:
  XOR r3, r4, r15
  OR r10, r14, r0
  AND r15, r13, r18
  SUBI r3, r8, 18
  SAR r9, r5, r2
  SHR r7, r11, r9
  SHR r0, r13, r8
  IKEY r5
  CMPI r5, 15
  JNZ r5, key_1
  XOR r8, r3, r15
  FRAME
  JMP main_0
