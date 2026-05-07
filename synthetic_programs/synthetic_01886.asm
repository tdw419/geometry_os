; counted animation
; initialization
  LDI r0, 0x2528C5
  LDI r7, 0x9BB478
  LDI r8, 256
  LDI r7, 20
loop_0:
  LDI r15, 2745
  LDI r6, 255
  LDI r5, 928
  LDI r4, 0xE83A01
  CIRCLE r15, r6, r5, r4
  ADDI r9, r11, 0x95420E
  LDI r12, 2422
  FILL r12
  ADDI r5, r7, 4
  LDI r4, 1
  SUB r7, r7, r4
  JNZ r7, loop_0
  LDI r11, 0x2453E1
loop_1:
  ANDI r6, r13, 133
  LDI r11, 64
  LDI r4, 64
  LDI r5, 0x173547
  LDI r4, 1650
  LDI r6, 255
  LINE r11, r4, r5, r4, r6
  LDI r31, 255
  LDI r0, 247
  LDI r3, 4
  WPIXEL
  LDI r2, 128
  LDI r20, 0x6FC3BA
  LDI r1, 10
  LDI r7, 64
  CIRCLE r2, r20, r1, r7
  LDI r9, 1
  SUB r11, r11, r9
  JNZ r11, loop_1
  HALT
