; drawing loop program
; initialization
  LDI r11, 2985
  LDI r16, 64
main_0:
  SAR r12, r1, r13
  SHL r30, r11, r12
  SHLI r13, r3, 0xD897BE
  IKEY r5
  CMPI r5, 17
  JNZ r5, key_1
  SUBI r15, r2, 163
  CMP r15, r9
  ANDI r3, r7, 255
  FRAME
  JMP main_0
