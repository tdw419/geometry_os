; input driven program
; initialization
  LDI r7, 0xBF4493
  LDI r1, 0x7B08E8
  LDI r9, 419
  LDI r14, 10
  LDI r11, 0x50C6FE
  LDI r4, 0x5586EB
  LDI r3, 3255
main_0:
  XOR r15, r0, r11
  AND r15, r5, r10
  AND r9, r8, r6
  SAR r10, r9, r1
  SAR r13, r0, r10
  SHLI r5, r7, 0x597F42
  SHR r9, r12, r7
  ANDI r0, r9, 32
  CMPI r3, 128
  XOR r11, r6, r14
  XOR r15, r0, r2
  XOR r14, r13, r3
  OR r7, r2, r10
  FRAME
  JMP main_0
