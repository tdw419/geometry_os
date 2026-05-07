; input driven program
; initialization
  LDI r8, 3321
  LDI r19, 4
  LDI r14, 1522
  LDI r1, 10
  LDI r13, 337
  LDI r3, 0x4B42C9
main_0:
  OR r8, r5, r18
  ANDI r12, r6, 0x067616
  LDI r14, 1033
  LDI r10, 16
  LDI r6, 8
  WPIXEL
  CMPI r10, r0, 0x0F5461
  IKEY r2
  CMPI r2, 142
  JNZ r2, key_1
  ANDI r11, r0, 104
  FRAME
  JMP main_0
