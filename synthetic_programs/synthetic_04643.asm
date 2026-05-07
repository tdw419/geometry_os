; counted animation
; initialization
  LDI r7, 128
  LDI r9, 0x5FB60D
  LDI r2, 8
  LDI r4, 128
  LDI r27, 0xC2523D
  LDI r8, 0xA387A6
loop_0:
  SUBI r13, r2, 212
  LDI r5, 636
  FILL r5
  SHR r0, r13, r12
  LDI r14, 1
  SUB r8, r8, r14
  JNZ r8, loop_0
  LDI r2, 0x2DFDE3
loop_1:
  SUBI r6, r15, 189
  ADDI r11, r9, 176
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_1
  LDI r4, 30
loop_2:
  LDI r11, 0x25434A
  LDI r1, 4
  LDI r1, 32
  WPIXEL
  ADDI r10, r8, 0x402AA9
  MUL r13, r1, r20
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_2
  HALT
