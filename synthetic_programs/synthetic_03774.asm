; drawing loop program
; initialization
  LDI r15, 0x4D40C7
  LDI r9, 0xBFA3EA
  LDI r1, 1976
  LDI r14, 0x40CC11
  LDI r3, 1
  LDI r6, 10
  LDI r5, 10
  LDI r26, 1818
main_0:
  SAR r11, r27, r5
  SHR r11, r15, r9
  SAR r2, r0, r4
  SAR r5, r4, r12
  LDI r23, 0xE37AAC
  LDI r11, 256
  LDI r2, 0xC87AD0
  DRAWTEXT r23, r11, r2, "WORLD"
  IKEY r12
  CMPI r12, 10
  JNZ r12, key_1
  FRAME
  JMP main_0
