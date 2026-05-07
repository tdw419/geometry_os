; counted animation
; initialization
  LDI r1, 0xC1C5BE
  LDI r7, 64
  LDI r9, 0x0818D7
  LDI r15, 0xC4425B
  LDI r7, 10
loop_0:
  LDI r10, 16
  LDI r15, 256
  LDI r30, 3559
  PSETI
  LDI r2, 2667
  LDI r9, 128
  LDI r2, 0xABAE89
  LDI r5, 0xAA149B
  CIRCLE r2, r9, r2, r5
  LDI r17, 1
  SUB r7, r7, r17
  JNZ r7, loop_0
  LDI r8, 128
loop_1:
  LDI r12, 128
  LDI r15, 3921
  LDI r4, 166
  PSETI
  LDI r0, 8
  LDI r13, 3236
  LDI r2, 10
  PSETI
  LDI r1, 1
  LDI r0, 256
  LDI r11, 2
  WPIXEL
  LDI r9, 3228
  LDI r4, 1625
  LDI r11, 0x3FA3ED
  PSETI
  LDI r4, 1
  SUB r8, r8, r4
  JNZ r8, loop_1
  LDI r2, 0x6F2D69
loop_2:
  LDI r13, 3965
  LDI r6, 0x4299F6
  LDI r10, 0
  LDI r2, 0xE00D8B
  LDI r8, 0xF46B8D
  RECTF r13, r6, r10, r2, r8
  LDI r0, 255
  LDI r17, 16
  LDI r13, 255
  PSETI
  LDI r2, 1394
  LDI r7, 255
  LDI r1, 0xB24FC4
  LDI r12, 3045
  LDI r11, 256
  RECTF r2, r7, r1, r12, r11
  LDI r15, 1
  SUB r2, r2, r15
  JNZ r2, loop_2
  HALT
