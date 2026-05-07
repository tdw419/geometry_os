; input driven program
; initialization
  LDI r2, 0
  LDI r7, 0x69E248
  LDI r4, 8
  LDI r11, 128
  LDI r9, 0xF394A0
main_0:
  CMPI r7, r8, 102
  SAR r0, r4, r5
  SAR r1, r3, r9
  OR r11, r9, r2
  XOR r9, r15, r0
  XOR r1, r5, r4
  XOR r3, r8, r17
  SAR r12, r0, r15
  SHL r4, r13, r5
  FRAME
  JMP main_0
