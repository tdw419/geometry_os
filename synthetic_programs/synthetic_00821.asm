; input driven program
; initialization
  LDI r11, 0x06B13E
  LDI r14, 256
  LDI r7, 0x710774
  LDI r9, 0x670BE0
main_0:
  OR r9, r5, r3
  OR r8, r9, r4
  XOR r15, r0, r6
  XOR r12, r4, r9
  CMPI r6, r4, 108
  SUBI r4, r15, 8
  ADD r7, r2, r14
  FRAME
  JMP main_0
