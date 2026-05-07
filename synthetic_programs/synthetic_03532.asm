; mixed program
; initialization
  LDI r10, 3079
  LDI r7, 128
  LDI r2, 0xF0F1F3
  LDI r1, 0x2069A0
  LDI r9, 10
  LDI r4, 8
  LDI r15, 37
loop_0:
  CMPI r3, r7, 37
  DIV r5, r11, r0
  SHL r4, r8, r6
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_0
  CALL func_1
func_1:
  AND r8, r14, r7
  OR r4, r7, r9
  SHL r8, r11, r0
  RET
  LDI r2, 47
loop_2:
  LDI r4, 32
  LDI r4, 255
  LDI r9, 1240
  WPIXEL
  SUBI r8, r3, 128
  LDI r4, 1
  SUB r2, r2, r4
  JNZ r2, loop_2
  CMP r10, r14
  CMP r19, r7
  HALT
