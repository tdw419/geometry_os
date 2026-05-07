; counted animation
; initialization
  LDI r12, 255
  LDI r8, 4
  LDI r15, 3400
  LDI r3, 514
  LDI r8, 0xFB3E7B
loop_0:
  LDI r3, 10
  LDI r9, 1
  LDI r9, 10
  WPIXEL
  LDI r5, 1
  SUB r8, r8, r5
  JNZ r8, loop_0
  HALT
