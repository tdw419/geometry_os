; drawing loop program
; initialization
  LDI r7, 0x566539
  LDI r9, 32
main_0:
  SHL r2, r30, r13
  SAR r2, r9, r7
  SAR r3, r8, r12
  SHLI r7, r13, 255
  CMPI r4, r27, 8
  LDI r0, 1413
  LDI r5, 2454
  LDI r3, 2785
  WPIXEL
  SAR r8, r11, r4
  SHL r6, r2, r9
  SHL r11, r8, r14
  LDI r4, 255
  LDI r3, 0x7A2F4C
  LDI r3, 588
  WPIXEL
  FRAME
  JMP main_0
