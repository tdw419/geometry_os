; drawing loop program
; initialization
  LDI r8, 0xF5694D
  LDI r9, 0x2CC644
  LDI r14, 10
  LDI r15, 0x81FE7A
  LDI r6, 2
  LDI r10, 0x8002E6
main_0:
  IKEY r10
  CMPI r10, 47
  JNZ r10, key_1
  SAR r5, r4, r9
  SHL r1, r10, r6
  SAR r6, r7, r2
  SAR r8, r10, r11
  SAR r2, r8, r0
  SHL r15, r8, r11
  CMPI r1, 0x7A9DB5
  SUBI r7, r14, 0xA04580
  SHL r7, r1, r13
  SHR r15, r5, r6
  SHL r8, r10, r13
  SHR r24, r10, r11
  FRAME
  JMP main_0
