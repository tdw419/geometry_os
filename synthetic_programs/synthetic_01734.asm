; drawing loop program
; initialization
  LDI r7, 622
  LDI r14, 4029
  LDI r1, 255
  LDI r6, 8
  LDI r0, 1421
main_0:
  IKEY r11
  CMPI r11, 16
  JNZ r11, key_1
  CMP r11, r14
  IKEY r2
  CMPI r2, 0x64AB64
  JNZ r2, key_2
  SAR r2, r9, r8
  SHL r3, r15, r5
  SHR r9, r0, r11
  SAR r7, r12, r0
  SUBI r26, r5, 0xBA3D05
  FRAME
  JMP main_0
