; counted animation
; initialization
  LDI r9, 0x1975BB
  LDI r21, 0x652689
  LDI r0, 2866
  LDI r7, 841
  LDI r13, 8
  LDI r11, 0x099047
  LDI r12, 0x39B3F1
  LDI r6, 255
  LDI r0, 8
loop_0:
  LDI r5, 0x3CFEB5
  LDI r10, 0xFEC627
  LDI r4, 0xA6B5EF
  LDI r14, 715
  LDI r0, 4
  LINE r5, r10, r4, r14, r0
  SHR r8, r2, r11
  LDI r13, 1712
  LDI r12, 0xB51034
  LDI r10, 0x5692BF
  PSETI
  LDI r3, 1
  SUB r0, r0, r3
  JNZ r0, loop_0
  LDI r14, 32
loop_1:
  CMPI r1, r0, 256
  LDI r12, 1
  SUB r14, r14, r12
  JNZ r14, loop_1
  LDI r0, 48
loop_2:
  ADDI r0, r9, 1
  SUBI r2, r12, 32
  LDI r5, 1423
  LDI r2, 0xAB16E2
  LDI r15, 0
  WPIXEL
  LDI r3, 1
  SUB r0, r0, r3
  JNZ r0, loop_2
  HALT
