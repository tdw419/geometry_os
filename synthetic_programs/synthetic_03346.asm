; counted animation
; initialization
  LDI r8, 4
  LDI r15, 16
  LDI r13, 32
loop_0:
  LDI r5, 0x4F841F
  LDI r4, 1165
  LDI r15, 0xF75B0C
  LDI r4, 0x71F7E5
  LDI r8, 3032
  RECTF r5, r4, r15, r4, r8
  OR r5, r2, r6
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_0
  LDI r10, 31
loop_1:
  DIV r12, r11, r8
  LDI r11, 0xEEB923
  LDI r10, 873
  LDI r12, 1455
  LDI r3, 464
  LDI r11, 4
  RECTF r11, r10, r12, r3, r11
  ANDI r0, r2, 128
  LDI r11, 1
  SUB r10, r10, r11
  JNZ r10, loop_1
  LDI r14, 46
loop_2:
  CMPI r4, r8, 0x4E8103
  LDI r4, 0x410A0B
  LDI r13, 10
  LDI r0, 0xCCF595
  LDI r7, 4
  LDI r12, 0xFC48F9
  RECTF r4, r13, r0, r7, r12
  LDI r13, 277
  FILL r13
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_2
  HALT
