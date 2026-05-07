; input driven program
; initialization
  LDI r2, 32
  LDI r15, 255
  LDI r3, 255
  LDI r7, 0x34DA55
  LDI r13, 10
  LDI r5, 2
main_0:
  SUBI r13, r14, 0
  AND r12, r11, r4
  OR r9, r7, r5
  OR r2, r9, r4
  XOR r5, r6, r13
  LDI r14, 10
  LDI r8, 0
  LDI r1, 0xE060EC
  LDI r3, 353
  LDI r9, 1
  LINE r14, r8, r1, r3, r9
  CMPI r3, r8, 171
  LDI r11, 2154
  LDI r0, 3646
  LDI r9, 1653
  PSETI
  FRAME
  JMP main_0
