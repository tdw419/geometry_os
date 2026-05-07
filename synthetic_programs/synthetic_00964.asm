; counted animation
; initialization
  LDI r7, 3536
  LDI r1, 2904
  LDI r6, 2531
  LDI r13, 0
loop_0:
  SUBI r13, r0, 255
  LDI r2, 0xD19D59
  LDI r14, 1212
  LDI r15, 0x6BC510
  LDI r15, 0x77C1D2
  CIRCLE r2, r14, r15, r15
  CMPI r10, r5, 16
  LDI r9, 1
  SUB r13, r13, r9
  JNZ r13, loop_0
  LDI r14, 0x83ADF3
loop_1:
  ANDI r21, r6, 32
  LDI r7, 16
  LDI r1, 3465
  LDI r7, 1
  LDI r15, 256
  LDI r7, 0
  LINE r7, r1, r7, r15, r7
  SUBI r8, r10, 70
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_1
  LDI r12, 2
loop_2:
  AND r19, r11, r8
  LDI r10, 256
  LDI r3, 0x425787
  LDI r3, 0x00FE14
  WPIXEL
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_2
  HALT
