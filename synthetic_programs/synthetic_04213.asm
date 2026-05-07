; counted animation
; initialization
  LDI r3, 1376
  LDI r12, 128
  LDI r7, 2179
  LDI r18, 0
  LDI r4, 68
  LDI r0, 2
  LDI r15, 4
loop_0:
  SUBI r11, r0, 0xEF79F6
  ANDI r7, r3, 255
  SUBI r11, r14, 16
  MOD r6, r0, r10
  LDI r0, 1
  SUB r15, r15, r0
  JNZ r15, loop_0
  LDI r4, 39
loop_1:
  DIV r1, r9, r15
  SUBI r4, r15, 4
  LDI r10, 1
  SUB r4, r4, r10
  JNZ r4, loop_1
  LDI r1, 0x6F1AE5
loop_2:
  OR r9, r15, r8
  OR r29, r13, r7
  LDI r14, 128
  FILL r14
  LDI r11, 1
  SUB r1, r1, r11
  JNZ r1, loop_2
  HALT
