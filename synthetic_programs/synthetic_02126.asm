; mixed program
; initialization
  LDI r9, 3555
  LDI r14, 256
  LDI r2, 0x068437
  LDI r3, 0xAA6C50
  LDI r5, 3500
  LDI r1, 1
  LDI r13, 1413
; palette
  LDI r10, 0x4095
  LDI r11, 1
  LDI r8, 0xAAAAAA
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x0044FF
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x888800
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0xAA00AA
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x44FF00
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x00FF00
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0xFFFFFF
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x0000CC
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0xAAAAAA
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0x008888
  STORE r10, r8
  ADD r10, r10, r11
  LDI r8, 0xFFFFFF
  STORE r10, r8
  ADD r10, r10, r11
  CMP r7, r14
  JNZ r7, else_0
  OR r5, r0, r6
  OR r9, r10, r14
  JMP endif_1
else_0:
  LDI r4, 0xDB417D
  LDI r2, 256
  LDI r15, 4
  LDI r12, 10
  CIRCLE r4, r2, r15, r12
  LDI r4, 32
  LDI r0, 32
  LDI r1, 0
  LDI r4, 8
  LDI r4, 0xCD1A8B
  RECTF r4, r0, r1, r4, r4
endif_1:
  DIV r15, r2, r7
  CMP r3, r8
  SUB r6, r30, r1
  LDI r8, 0xCFD08C
  LDI r1, 0x875B01
  LDI r11, 1
  TEXT r8, r1, r11, "HELLO"
  CMP r2, r29
  JZ r2, else_2
  XOR r2, r6, r11
  MUL r2, r9, r5
  ADD r1, r4, r6
  OR r12, r2, r11
  JMP endif_3
else_2:
  LDI r11, 0x2EA4EC
  LDI r9, 0x754F85
  LDI r23, 4
  WPIXEL
  LDI r15, 255
  LDI r8, 3273
  LDI r6, 537
  WPIXEL
  LDI r3, 2988
  LDI r5, 255
  LDI r15, 32
  LDI r11, 0xDF0C57
  LDI r10, 2503
  RECTF r3, r5, r15, r11, r10
endif_3:
  HALT
