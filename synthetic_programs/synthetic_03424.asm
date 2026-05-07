; counted animation
; initialization
  LDI r15, 2
  LDI r10, 1
  LDI r11, 0x5A4E70
  LDI r0, 3806
  LDI r3, 256
  LDI r2, 255
  LDI r14, 10
  LDI r17, 255
loop_0:
  CMPI r12, r3, 0xDBD4F1
  LDI r11, 1
  SUB r17, r17, r11
  JNZ r17, loop_0
  HALT
