; counted animation
; initialization
  LDI r0, 3830
  LDI r8, 16
  LDI r12, 32
  LDI r5, 0xAB336C
  LDI r10, 8
  LDI r7, 2
loop_0:
  LDI r1, 2356
  LDI r4, 475
  LDI r3, 32
  LDI r14, 64
  LDI r4, 64
  RECTF r1, r4, r3, r14, r4
  LDI r4, 4
  LDI r9, 0xB0D496
  LDI r7, 2341
  WPIXEL
  ANDI r6, r9, 256
  LDI r0, 2065
  LDI r9, 64
  LDI r6, 0xE0C80B
  PSETI
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_0
  LDI r15, 10
loop_1:
  LDI r15, 128
  LDI r8, 0xE3E95D
  LDI r29, 898
  PSETI
  CMPI r13, r7, 0xBA8180
  LDI r11, 1
  SUB r15, r15, r11
  JNZ r15, loop_1
  HALT
