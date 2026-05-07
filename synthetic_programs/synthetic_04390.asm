; input driven program
; initialization
  LDI r5, 2792
  LDI r9, 3439
  LDI r11, 1
  LDI r3, 2
  LDI r2, 32
  LDI r6, 838
main_0:
  CMP r6, r2
  OR r7, r1, r4
  AND r27, r1, r7
  XOR r12, r15, r14
  ANDI r12, r1, 56
  CMPI r14, 128
  ANDI r10, r1, 240
  CMP r3, r6
  FRAME
  JMP main_0
