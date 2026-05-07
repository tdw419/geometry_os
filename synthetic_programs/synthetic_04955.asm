; mixed program
; initialization
  LDI r1, 3424
  LDI r13, 0x3E9395
  LDI r18, 0xCAF3C7
  LDI r25, 8
  LDI r10, 0x7C713F
  LDI r6, 3825
  LDI r8, 2732
  LDI r3, 1279
  SHL r11, r15, r4
  SHLI r12, r10, 0x178648
  CMP r7, r4
  JZ r7, else_0
  XOR r5, r10, r14
  OR r9, r13, r8
  SHL r1, r0, r15
  OR r15, r27, r11
  JMP endif_1
else_0:
  LDI r14, 16
  LDI r1, 0xAA0965
  LDI r1, 0x84EA9B
  PSETI
  LDI r13, 0x09E6A4
  FILL r13
endif_1:
  LDI r2, 0x2B5F03
  LDI r5, 992
  LDI r11, 0xEA3C9F
  LDI r11, 0x0C53D0
  LDI r6, 0x5228F3
  RECTF r2, r5, r11, r11, r6
  CALL func_2
func_2:
  XOR r7, r1, r15
  SUB r13, r3, r11
  RET
  CALL func_3
func_3:
  OR r1, r2, r12
  DIV r8, r12, r3
  RET
  CMP r9, r4
main_4:
  SHL r8, r4, r15
  SHL r0, r12, r1
  SHR r4, r2, r15
  SHR r10, r4, r2
  XOR r3, r6, r13
  SAR r1, r3, r6
  SHL r15, r3, r11
  LDI r8, 0x4B0946
  LDI r8, 10
  LDI r8, 0x540302
  LDI r8, 8
  LDI r0, 0x4609ED
  LINE r8, r8, r8, r8, r0
  FRAME
  JMP main_4
