; counted animation
; initialization
  LDI r20, 1895
  LDI r14, 64
  LDI r1, 255
loop_0:
  CMPI r10, r8, 0x9D11C6
  LDI r13, 1
  SUB r1, r1, r13
  JNZ r1, loop_0
  LDI r6, 2
loop_1:
  LDI r13, 3482
  LDI r15, 1987
  LDI r1, 0x4F21A1
  LDI r23, 0xD24842
  LDI r5, 0x73E157
  RECTF r13, r15, r1, r23, r5
  LDI r1, 1
  SUB r6, r6, r1
  JNZ r6, loop_1
  LDI r10, 32
loop_2:
  ADDI r15, r2, 0x29A3FD
  CMPI r1, r4, 255
  ANDI r8, r31, 0xB7AD4C
  LDI r6, 64
  LDI r9, 0xC24E45
  LDI r15, 10
  LDI r15, 0x9A7E6C
  LDI r6, 0x038770
  RECTF r6, r9, r15, r15, r6
  LDI r13, 1
  SUB r10, r10, r13
  JNZ r10, loop_2
  HALT
