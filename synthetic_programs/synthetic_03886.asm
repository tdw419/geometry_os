; counted animation
; initialization
  LDI r9, 16
  LDI r4, 0x828E5F
  LDI r2, 0xE8C8D0
  LDI r11, 0xF37809
  LDI r0, 0xA145FF
  LDI r8, 0xFFF4F6
  LDI r13, 64
  LDI r14, 0x569FA1
  LDI r18, 11
loop_0:
  SUB r0, r9, r22
  SUBI r27, r3, 34
  SUBI r14, r2, 129
  LDI r2, 1
  SUB r18, r18, r2
  JNZ r18, loop_0
  LDI r4, 8
loop_1:
  SUB r0, r10, r13
  SUBI r12, r1, 193
  LDI r4, 0xC508C2
  FILL r4
  MUL r11, r8, r13
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_1
  LDI r1, 0x769827
loop_2:
  CMPI r0, r9, 1
  LDI r6, 2737
  LDI r13, 0xF2C8B3
  LDI r15, 0x6A8A45
  WPIXEL
  ANDI r1, r5, 10
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_2
  HALT
