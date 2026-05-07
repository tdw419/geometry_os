; counted animation
; initialization
  LDI r15, 1151
  LDI r10, 0xD70040
  LDI r5, 32
  LDI r8, 64
  LDI r0, 0x5E4D6C
  LDI r13, 1
  LDI r12, 0xCD2983
  LDI r2, 255
  LDI r6, 0x758D98
loop_0:
  ANDI r21, r14, 144
  CMPI r14, r10, 0xAFC547
  LDI r2, 1
  SUB r6, r6, r2
  JNZ r6, loop_0
  LDI r7, 64
loop_1:
  LDI r8, 10
  LDI r5, 0
  LDI r9, 1179
  LDI r11, 287
  CIRCLE r8, r5, r9, r11
  CMPI r5, r6, 166
  AND r13, r5, r6
  LDI r14, 0x24BB3F
  LDI r11, 0xBF52C3
  LDI r1, 1
  LDI r14, 0x403651
  LDI r15, 0x5B4130
  LINE r14, r11, r1, r14, r15
  LDI r10, 1
  SUB r7, r7, r10
  JNZ r7, loop_1
  LDI r4, 15
loop_2:
  ADD r2, r6, r9
  SUBI r15, r19, 58
  LDI r3, 1
  SUB r4, r4, r3
  JNZ r4, loop_2
  HALT
