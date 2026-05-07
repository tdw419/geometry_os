; input driven program
; initialization
  LDI r11, 1800
  LDI r14, 0x9F973F
  LDI r12, 3233
main_0:
  CMPI r1, 49
  LDI r7, 1307
  LDI r0, 8
  LDI r12, 256
  PSETI
  SHL r14, r2, r5
  SAR r6, r1, r0
  SHR r7, r13, r0
  FRAME
  JMP main_0
