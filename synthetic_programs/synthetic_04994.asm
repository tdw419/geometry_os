; counted animation
; initialization
  LDI r23, 16
  LDI r15, 877
  LDI r12, 2345
  LDI r4, 256
  LDI r11, 0x061F7F
  LDI r16, 3793
  LDI r14, 4
  LDI r15, 1
loop_0:
  AND r9, r8, r1
  LDI r27, 1
  SUB r15, r15, r27
  JNZ r15, loop_0
  LDI r11, 255
loop_1:
  LDI r28, 0x5D17EF
  LDI r14, 0x03C09A
  LDI r15, 1953
  LDI r2, 0xC92BAA
  CIRCLE r28, r14, r15, r2
  CMPI r9, r7, 2
  LDI r9, 0x4ABBBE
  LDI r2, 3187
  LDI r29, 215
  WPIXEL
  LDI r1, 1
  SUB r11, r11, r1
  JNZ r11, loop_1
  HALT
