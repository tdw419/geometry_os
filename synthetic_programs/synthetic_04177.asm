; counted animation
; initialization
  LDI r4, 255
  LDI r15, 8
  LDI r2, 0
  LDI r17, 0x00DEAB
  LDI r1, 0xDDEFD4
  LDI r6, 10
  LDI r9, 1596
  LDI r13, 64
  LDI r14, 256
loop_0:
  LDI r12, 1183
  LDI r3, 0x3EF8DF
  LDI r4, 0xEFB520
  LDI r2, 144
  CIRCLE r12, r3, r4, r2
  LDI r1, 10
  LDI r6, 1413
  LDI r13, 0x3E0552
  LDI r2, 0x716475
  LDI r4, 0xD9A8C3
  RECTF r1, r6, r13, r2, r4
  LDI r10, 1
  SUB r14, r14, r10
  JNZ r14, loop_0
  LDI r4, 0
loop_1:
  CMPI r12, r0, 64
  LDI r6, 1990
  LDI r5, 57
  LDI r15, 128
  LDI r3, 3014
  LDI r1, 0
  RECTF r6, r5, r15, r3, r1
  MOD r9, r6, r3
  LDI r5, 0x04FC18
  LDI r9, 1348
  LDI r23, 256
  LDI r8, 0xFC01B8
  CIRCLE r5, r9, r23, r8
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  LDI r10, 29
loop_2:
  CMPI r13, r11, 0xFF805B
  LDI r5, 1
  SUB r10, r10, r5
  JNZ r10, loop_2
  HALT
