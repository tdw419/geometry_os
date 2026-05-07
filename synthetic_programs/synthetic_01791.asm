; counted animation
; initialization
  LDI r8, 725
  LDI r10, 0x9BF5E3
  LDI r2, 3078
  LDI r14, 10
  LDI r7, 3871
  LDI r3, 2608
  LDI r0, 1334
  LDI r15, 0x6CF4A4
  LDI r6, 5
loop_0:
  CMPI r2, r7, 10
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_0
  LDI r14, 64
loop_1:
  LDI r11, 0x0BF68B
  LDI r13, 0x04CE80
  LDI r10, 2088
  LDI r4, 735
  LDI r1, 8
  LINE r11, r13, r10, r4, r1
  LDI r9, 32
  LDI r2, 0xF9EBAE
  LDI r29, 2347
  WPIXEL
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_1
  LDI r1, 32
loop_2:
  SUBI r28, r2, 0x79EB41
  ANDI r4, r1, 0xFB4046
  XOR r7, r10, r15
  CMPI r2, r26, 230
  LDI r3, 1
  SUB r1, r1, r3
  JNZ r1, loop_2
  HALT
