; counted animation
; initialization
  LDI r2, 0x11A996
  LDI r7, 256
  LDI r13, 1822
  LDI r9, 8
  LDI r6, 0xD34355
loop_0:
  LDI r10, 0x12A13C
  LDI r11, 0x5C5F04
  LDI r11, 10
  PSETI
  LDI r7, 1
  SUB r6, r6, r7
  JNZ r6, loop_0
  LDI r13, 8
loop_1:
  LDI r0, 1676
  LDI r8, 0x5702F8
  LDI r2, 10
  LDI r4, 0x604346
  LDI r9, 0x0AC072
  RECTF r0, r8, r2, r4, r9
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_1
  HALT
