; input driven program
; initialization
  LDI r7, 327
  LDI r2, 0xD2AD06
  LDI r11, 3642
main_0:
  SAR r7, r0, r15
  SAR r16, r7, r1
  SHL r5, r3, r9
  SHL r2, r15, r12
  LDI r8, 10
  LDI r0, 128
  LDI r5, 0x1D8FFA
  LDI r1, 2
  CIRCLE r8, r0, r5, r1
  CMPI r14, 0x309D72
  XOR r11, r8, r29
  OR r5, r13, r8
  AND r15, r13, r5
  FRAME
  JMP main_0
