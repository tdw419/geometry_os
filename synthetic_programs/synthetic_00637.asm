; counted animation
; initialization
  LDI r13, 255
  LDI r5, 0x8F3910
  LDI r9, 256
  LDI r11, 0xAE0F2F
  LDI r5, 2
loop_0:
  ADDI r11, r9, 0x2E1C5F
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_0
  HALT
