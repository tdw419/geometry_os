; counted animation
; initialization
  LDI r11, 256
  LDI r8, 0x2F7FDB
  LDI r1, 1462
  LDI r9, 10
  LDI r15, 993
  LDI r0, 0xC3FBCC
  LDI r14, 2431
  LDI r10, 64
  LDI r9, 0x0720E6
loop_0:
  ANDI r3, r10, 0x01C976
  LDI r8, 0x1ADA85
  LDI r15, 4
  LDI r1, 1669
  WPIXEL
  LDI r16, 1
  SUB r9, r9, r16
  JNZ r9, loop_0
  LDI r7, 0
loop_1:
  SHL r11, r2, r4
  LDI r9, 3825
  LDI r9, 2699
  LDI r8, 3592
  PSET r9, r9, r8
  CMPI r3, r4, 0xD465D3
  CMPI r12, r20, 0x43B66F
  LDI r14, 1
  SUB r7, r7, r14
  JNZ r7, loop_1
  LDI r2, 0x6859B1
loop_2:
  SUBI r10, r3, 0x6ECF77
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_2
  HALT
