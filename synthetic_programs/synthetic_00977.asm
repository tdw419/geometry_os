; input driven program
; initialization
  LDI r15, 0xED04C6
  LDI r13, 0xBB43BD
  LDI r8, 0
main_0:
  IKEY r1
  CMPI r1, 172
  JNZ r1, key_1
  IKEY r7
  CMPI r7, 0x972D8C
  JNZ r7, key_2
  CMP r2, r8
  OR r13, r5, r9
  XOR r12, r2, r24
  SAR r14, r25, r2
  SHL r5, r8, r2
  SHL r15, r14, r11
  SUBI r6, r15, 0x1841DC
  FRAME
  JMP main_0
