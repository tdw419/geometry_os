; counted animation
; initialization
  LDI r2, 0xE7D243
  LDI r5, 0x0C094B
  LDI r10, 868
  LDI r13, 323
  LDI r6, 0
  LDI r15, 3
loop_0:
  SUB r10, r4, r13
  DIV r3, r13, r11
  LDI r8, 1
  SUB r15, r15, r8
  JNZ r15, loop_0
  LDI r1, 0x6AC8CD
loop_1:
  LDI r11, 16
  LDI r14, 0x9B44A3
  LDI r4, 4
  PSET r11, r14, r4
  OR r14, r9, r7
  ADD r9, r4, r14
  LDI r10, 1
  SUB r1, r1, r10
  JNZ r1, loop_1
  LDI r5, 0
loop_2:
  LDI r1, 0x5136F9
  LDI r13, 1095
  LDI r12, 128
  WPIXEL
  LDI r9, 1
  SUB r5, r5, r9
  JNZ r5, loop_2
  HALT
