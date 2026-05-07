; mixed program
; initialization
  LDI r15, 2058
  LDI r10, 0x2C9BE2
  LDI r7, 3570
  LDI r7, 32
  LDI r14, 8
  DRAWTEXT r7, r7, r14, "WORLD"
  LDI r11, 23
loop_0:
  DIV r29, r13, r9
  LDI r15, 128
  LDI r5, 351
  LDI r9, 0x03F49A
  WPIXEL
  CMPI r6, r12, 212
  LDI r9, 1
  SUB r11, r11, r9
  JNZ r11, loop_0
  CMP r14, r4
  JNZ r14, else_1
  ADD r1, r7, r8
  AND r26, r9, r2
  MUL r6, r4, r0
  ADD r8, r12, r7
  JMP endif_2
else_1:
  LDI r9, 0xAE7D9E
  LDI r8, 2828
  LDI r20, 0
  LDI r15, 1757
  LDI r23, 2
  RECTF r9, r8, r20, r15, r23
  LDI r0, 0xF9E307
  LDI r15, 4
  LDI r10, 0x7ABCEC
  PSET r0, r15, r10
  LDI r2, 64
  LDI r14, 64
  LDI r0, 3255
  WPIXEL
endif_2:
  CMPI r2, 16
  LDI r0, 0
  LDI r4, 3376
  LDI r12, 10
  LDI r9, 0
  LDI r22, 2953
  RECTF r0, r4, r12, r9, r22
  AND r8, r4, r0
  LDI r14, 3928
  LDI r1, 2
  LDI r12, 256
  TEXT r14, r1, r12, "HELLO"
  HALT
