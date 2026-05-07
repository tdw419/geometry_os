; mixed program
; initialization
  LDI r11, 1
  LDI r8, 1
  LDI r7, 3810
  LDI r2, 1449
  LDI r10, 0xD57528
  LDI r9, 255
  LDI r6, 2
  OR r5, r0, r12
  OR r0, r8, r10
  XOR r8, r9, r15
  LDI r6, 128
loop_0:
  LDI r13, 0xA1F9DA
  FILL r13
  CMPI r6, r3, 0x35E252
  SUBI r4, r10, 0x40F883
  SUBI r8, r13, 0x191775
  LDI r14, 1
  SUB r6, r6, r14
  JNZ r6, loop_0
  LDI r1, 46
loop_1:
  SUBI r9, r10, 0xA065D7
  DIV r13, r10, r8
  ANDI r5, r7, 10
  LDI r9, 1
  SUB r1, r1, r9
  JNZ r1, loop_1
  LDI r1, 16
loop_2:
  SUBI r11, r2, 0x1C6966
  ANDI r11, r1, 0xC1ABDE
  LDI r11, 1
  SUB r1, r1, r11
  JNZ r1, loop_2
  SAR r4, r7, r2
  SHL r4, r8, r15
  SHL r7, r21, r1
  SHLI r13, r1, 0xDE63FC
main_3:
  LDI r15, 597
  LDI r8, 0
  LDI r6, 3506
  LDI r8, 3075
  LDI r15, 1194
  LINE r15, r8, r6, r8, r15
  SHR r6, r8, r14
  SHL r10, r2, r13
  SHLI r1, r7, 0
  SAR r12, r10, r1
  LDI r17, 0x7A515B
  FILL r17
  FRAME
  JMP main_3
