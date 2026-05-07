; mixed program
; initialization
  LDI r9, 1840
  LDI r13, 1879
  LDI r14, 2246
  LDI r19, 0x45605C
  LDI r4, 0x0D4280
  LDI r10, 763
  LDI r15, 8
  LDI r2, 0x7E903F
  LDI r13, 0xF5C5D5
  LDI r5, 4
  LDI r10, 0x580632
  DRAWTEXT r13, r5, r10, "WORLD"
  CMP r4, r13
  LDI r11, 0x38C06B
  LDI r15, 0x73D525
  LDI r8, 0xB39BF6
  WPIXEL
  IKEY r0
  CMPI r0, 63
  JNZ r0, key_0
  CMP r9, r8
  CMP r25, r9
  SUB r6, r9, r15
main_1:
  SHLI r15, r3, 5
  SAR r25, r9, r5
  SHR r4, r7, r0
  IKEY r0
  CMPI r0, 246
  JNZ r0, key_2
  CMP r0, r3
  FRAME
  JMP main_1
