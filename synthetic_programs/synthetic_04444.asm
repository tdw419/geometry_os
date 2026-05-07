; input driven program
; initialization
  LDI r6, 0
  LDI r15, 606
  LDI r10, 2097
main_0:
  CMPI r10, 55
  SAR r15, r8, r13
  SAR r11, r2, r10
  SHLI r8, r2, 16
  SHLI r8, r14, 0xA3F3B9
  DIV r10, r6, r14
  LDI r8, 3000
  LDI r15, 1726
  LDI r11, 2
  WPIXEL
  SAR r8, r10, r2
  SHR r27, r8, r2
  SHLI r1, r7, 4
  SHR r3, r4, r13
  FRAME
  JMP main_0
