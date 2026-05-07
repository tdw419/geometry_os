; mixed program
; initialization
  LDI r16, 210
  LDI r3, 0x916EC4
  LDI r5, 64
  LDI r0, 256
  LDI r7, 2
  LDI r13, 255
  LDI r15, 8
  LDI r15, 32
  LDI r7, 16
  LDI r6, 16
  WPIXEL
  SAR r9, r2, r3
  SAR r4, r7, r0
  SHLI r12, r2, 255
  CALL func_0
func_0:
  OR r12, r7, r14
  MOD r4, r7, r9
  RET
main_1:
  LDI r11, 10
  LDI r7, 16
  LDI r12, 256
  LDI r14, 0x7D88AF
  CIRCLE r11, r7, r12, r14
  LDI r15, 3153
  LDI r3, 0x535905
  LDI r3, 8
  DRAWTEXT r15, r3, r3, "WORLD"
  CMPI r30, 77
  CMP r7, r0
  FRAME
  JMP main_1
