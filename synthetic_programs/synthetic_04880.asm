; mixed program
; initialization
  LDI r10, 16
  LDI r2, 256
  LDI r11, 3722
  LDI r8, 0xC3449F
  LDI r14, 2381
  LDI r7, 3619
  LDI r10, 0xF77A81
  LDI r11, 58
  DRAWTEXT r7, r10, r11, "WORLD"
  CALL func_0
func_0:
  SHR r0, r15, r11
  MUL r6, r8, r5
  OR r4, r10, r11
  SHL r3, r4, r0
  RET
  CMP r25, r2
  XOR r14, r6, r4
  OR r4, r3, r25
  OR r13, r6, r1
main_1:
  LDI r7, 2
  LDI r4, 256
  LDI r12, 0x4E47C7
  TEXT r7, r4, r12, "HELLO"
  XOR r14, r4, r6
  XOR r10, r3, r2
  OR r11, r8, r6
  OR r11, r1, r14
  ANDI r10, r11, 43
  SAR r8, r0, r11
  SAR r7, r0, r3
  SHR r15, r6, r12
  LDI r0, 0x14395A
  LDI r8, 2977
  LDI r27, 1
  PSET r0, r8, r27
  FRAME
  JMP main_1
