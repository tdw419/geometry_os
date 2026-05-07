; counted animation
; initialization
  LDI r11, 1745
  LDI r4, 0xA55771
  LDI r0, 32
  LDI r13, 255
  LDI r8, 255
  LDI r5, 8
  LDI r14, 0x11629C
  LDI r6, 313
  LDI r5, 128
loop_0:
  CMPI r11, r5, 2
  ANDI r12, r7, 0xA9ABD3
  SHR r11, r15, r1
  LDI r15, 1121
  LDI r0, 64
  LDI r14, 0xE3132F
  WPIXEL
  LDI r8, 1
  SUB r5, r5, r8
  JNZ r5, loop_0
  LDI r2, 0x460EA3
loop_1:
  LDI r14, 8
  LDI r7, 2
  LDI r15, 3916
  LDI r8, 128
  CIRCLE r14, r7, r15, r8
  LDI r13, 2344
  LDI r14, 16
  LDI r2, 0x5AE664
  PSET r13, r14, r2
  LDI r6, 1
  SUB r2, r2, r6
  JNZ r2, loop_1
  HALT
