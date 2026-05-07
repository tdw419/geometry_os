; input driven program
; initialization
  LDI r12, 256
  LDI r2, 0x044DBD
  LDI r15, 8
  LDI r0, 396
main_0:
  SUBI r4, r2, 59
  SHL r10, r2, r8
  SAR r13, r15, r3
  SAR r10, r15, r11
  SHL r1, r15, r14
  AND r3, r11, r8
  OR r9, r13, r8
  XOR r14, r12, r13
  IKEY r7
  CMPI r7, 41
  JNZ r7, key_1
  LDI r14, 0x687EDA
  LDI r5, 0x61D841
  LDI r0, 0xC4E071
  PSETI
  CMPI r15, r0, 4
  FRAME
  JMP main_0
