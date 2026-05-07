; input driven program
; initialization
  LDI r2, 64
  LDI r9, 0xB84F61
  LDI r5, 0xEF5DC6
  LDI r4, 64
  LDI r12, 3833
  LDI r14, 2591
  LDI r1, 1983
main_0:
  ADDI r2, r0, 0xB2E518
  OR r2, r13, r4
  SUBI r15, r30, 16
  OR r15, r5, r1
  SHL r11, r0, r8
  SHR r3, r1, r0
  SAR r9, r6, r16
  IKEY r9
  CMPI r9, 24
  JNZ r9, key_1
  FRAME
  JMP main_0
