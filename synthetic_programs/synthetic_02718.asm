; counted animation
; initialization
  LDI r31, 2850
  LDI r13, 8
  LDI r10, 0xCBF6BD
  LDI r12, 0x46862D
  LDI r2, 0xFFFB5C
  LDI r7, 0x7D12E8
  LDI r11, 8
  LDI r3, 0x653F71
  LDI r5, 255
loop_0:
  LDI r8, 0xB94928
  LDI r11, 0x27E292
  LDI r2, 3347
  LDI r4, 1
  CIRCLE r8, r11, r2, r4
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_0
  LDI r12, 64
loop_1:
  SHR r10, r4, r7
  SUBI r3, r1, 2
  CMPI r9, r12, 43
  SUBI r14, r13, 76
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_1
  LDI r2, 32
loop_2:
  ANDI r13, r18, 219
  LDI r2, 16
  LDI r15, 0x6F46B6
  LDI r4, 454
  LDI r9, 2769
  LDI r5, 330
  RECTF r2, r15, r4, r9, r5
  LDI r9, 1531
  LDI r11, 2
  LDI r7, 0xB77545
  PSETI
  ADDI r12, r4, 10
  LDI r10, 1
  SUB r2, r2, r10
  JNZ r2, loop_2
  HALT
