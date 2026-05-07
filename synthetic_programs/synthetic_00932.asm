; drawing loop program
; initialization
  LDI r2, 1597
  LDI r1, 0
  LDI r10, 2948
  LDI r15, 3883
  LDI r4, 0x029D46
  LDI r12, 2268
main_0:
  AND r6, r3, r8
  AND r14, r6, r12
  OR r2, r0, r3
  XOR r2, r11, r15
  LDI r5, 64
  LDI r15, 724
  LDI r3, 0xFFF1B8
  LDI r14, 10
  LDI r19, 0
  LINE r5, r15, r3, r14, r19
  AND r15, r2, r5
  OR r13, r5, r26
  AND r15, r8, r3
  AND r14, r5, r1
  CMPI r11, 32
  FRAME
  JMP main_0
