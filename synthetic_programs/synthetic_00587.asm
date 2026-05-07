; input driven program
; initialization
  LDI r2, 16
  LDI r4, 1
  LDI r19, 32
  LDI r8, 884
  LDI r10, 122
  LDI r1, 3562
  LDI r6, 0x3A9325
  LDI r14, 16
main_0:
  IKEY r12
  CMPI r12, 0x616726
  JNZ r12, key_1
  SHL r4, r6, r1
  SHLI r11, r20, 0x757385
  SHL r8, r9, r2
  ANDI r13, r2, 41
  SHL r4, r0, r5
  SHLI r13, r6, 16
  SHLI r12, r11, 128
  SAR r4, r10, r9
  SAR r12, r3, r4
  SAR r9, r2, r11
  SAR r8, r12, r5
  AND r8, r10, r1
  XOR r4, r1, r2
  OR r8, r2, r25
  FRAME
  JMP main_0
