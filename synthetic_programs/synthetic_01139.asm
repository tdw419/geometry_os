; counted animation
; initialization
  LDI r6, 9
  LDI r2, 0
  LDI r12, 256
  LDI r11, 128
  LDI r31, 0xDAAC06
  LDI r15, 3043
  LDI r9, 530
  LDI r3, 10
  LDI r4, 0x344C63
loop_0:
  CMPI r12, r1, 189
  LDI r10, 1
  SUB r4, r4, r10
  JNZ r4, loop_0
  LDI r2, 38
loop_1:
  SHL r15, r14, r1
  LDI r8, 1
  SUB r2, r2, r8
  JNZ r2, loop_1
  LDI r0, 8
loop_2:
  LDI r9, 255
  LDI r13, 2458
  LDI r2, 507
  WPIXEL
  SUBI r0, r5, 68
  AND r12, r4, r0
  LDI r1, 1
  SUB r0, r0, r1
  JNZ r0, loop_2
  HALT
