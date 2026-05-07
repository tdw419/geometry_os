; counted animation
; initialization
  LDI r2, 32
  LDI r14, 32
  LDI r11, 0xE2164E
  LDI r7, 64
  LDI r20, 0x2B6B8A
  LDI r1, 2909
  LDI r5, 1
  LDI r24, 0x57A64C
  LDI r12, 2
loop_0:
  LDI r9, 255
  FILL r9
  LDI r8, 1
  SUB r12, r12, r8
  JNZ r12, loop_0
  LDI r21, 0x8230D3
loop_1:
  OR r11, r3, r14
  LDI r0, 1
  SUB r21, r21, r0
  JNZ r21, loop_1
  HALT
