; input driven program
; initialization
  LDI r14, 1950
  LDI r13, 255
main_0:
  SHL r18, r10, r9
  SAR r11, r3, r2
  SHL r10, r1, r25
  CMPI r25, r2, 162
  OR r6, r11, r9
  ADDI r2, r1, 0x36A853
  FRAME
  JMP main_0
