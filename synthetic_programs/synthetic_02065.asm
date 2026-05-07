; counted animation
; initialization
  LDI r3, 1
  LDI r4, 384
  LDI r18, 128
  LDI r7, 0x9F5ADE
  LDI r5, 64
  LDI r2, 4058
  LDI r25, 255
loop_0:
  LDI r9, 255
  LDI r10, 255
  LDI r15, 1246
  PSETI
  XOR r8, r14, r0
  LDI r9, 1
  SUB r25, r25, r9
  JNZ r25, loop_0
  LDI r3, 0xB3ACDB
loop_1:
  ADDI r13, r8, 0x92826F
  ANDI r7, r9, 202
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_1
  LDI r9, 255
loop_2:
  LDI r11, 255
  FILL r11
  SUBI r5, r1, 0xA9351F
  CMPI r8, r1, 0xFF768E
  LDI r3, 1
  SUB r9, r9, r3
  JNZ r9, loop_2
  HALT
