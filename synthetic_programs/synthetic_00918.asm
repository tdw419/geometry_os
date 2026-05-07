; input driven program
; initialization
  LDI r11, 0
  LDI r29, 4038
  LDI r5, 1184
  LDI r10, 8
  LDI r6, 255
  LDI r3, 1756
  LDI r13, 2
  LDI r12, 723
main_0:
  SUBI r0, r15, 0xBB543D
  CMP r4, r13
  SUBI r15, r2, 0x309A2A
  OR r6, r7, r0
  OR r6, r7, r13
  OR r10, r2, r5
  CMPI r6, 119
  FRAME
  JMP main_0
