; input driven program
; initialization
  LDI r1, 8
  LDI r4, 2
  LDI r15, 0xABA18C
  LDI r6, 0x4E29E1
  LDI r2, 1
  LDI r9, 10
  LDI r11, 0x9D0AD4
  LDI r12, 0x02D6E7
main_0:
  IKEY r10
  CMPI r10, 0xFBFB99
  JNZ r10, key_1
  ANDI r2, r14, 0x9A7D8B
  AND r1, r2, r5
  OR r7, r20, r13
  OR r5, r11, r12
  DIV r5, r8, r6
  SHLI r13, r12, 0xDFD6AD
  SHR r11, r12, r31
  SAR r0, r3, r14
  SAR r10, r6, r12
  LDI r4, 2
  LDI r11, 32
  LDI r10, 128
  LDI r12, 1
  CIRCLE r4, r11, r10, r12
  FRAME
  JMP main_0
