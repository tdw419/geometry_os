; mixed program
; initialization
  LDI r6, 0x066E45
  LDI r4, 1218
  LDI r3, 1206
  LDI r9, 1977
  LDI r14, 64
  LDI r15, 1194
  LDI r4, 1
  LDI r31, 32
  LDI r1, 0x21BD18
  LDI r15, 0xA2C5D1
  RECTF r15, r4, r31, r1, r15
  LDI r25, 0xBE0715
loop_0:
  ANDI r15, r0, 85
  LDI r1, 1
  SUB r25, r25, r1
  JNZ r25, loop_0
  IKEY r11
  CMPI r11, 91
  JNZ r11, key_1
  SHL r12, r7, r6
  SHR r8, r11, r1
  SHR r5, r4, r3
  SAR r6, r3, r8
  LDI r7, 38
loop_2:
  ADDI r8, r10, 16
  ANDI r13, r21, 0x5ABD58
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_2
  CALL func_3
func_3:
  SUB r3, r6, r15
  SUB r12, r9, r3
  RET
  CMPI r2, 9
  HALT
