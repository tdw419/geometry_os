; counted animation
; initialization
  LDI r7, 3011
  LDI r15, 3789
  LDI r0, 128
  LDI r4, 2
  LDI r1, 64
loop_0:
  AND r11, r13, r0
  MUL r5, r6, r12
  LDI r6, 1
  SUB r1, r1, r6
  JNZ r1, loop_0
  LDI r14, 8
loop_1:
  ADDI r9, r2, 64
  XOR r14, r15, r6
  SUBI r12, r3, 256
  LDI r2, 1
  SUB r14, r14, r2
  JNZ r14, loop_1
  LDI r10, 0x13F247
loop_2:
  CMPI r9, r6, 140
  LDI r5, 0xD1506D
  FILL r5
  CMPI r2, r12, 0x022308
  CMPI r28, r8, 164
  LDI r4, 1
  SUB r10, r10, r4
  JNZ r10, loop_2
  HALT
