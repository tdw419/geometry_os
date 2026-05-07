; counted animation
; initialization
  LDI r6, 3077
  LDI r8, 8
  LDI r11, 654
  LDI r7, 255
  LDI r9, 0xD423E2
  LDI r15, 11
loop_0:
  ADDI r8, r15, 0x9A7127
  LDI r6, 2967
  LDI r3, 8
  LDI r13, 0xBD8D35
  LDI r14, 619
  LDI r2, 1
  RECTF r6, r3, r13, r14, r2
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_0
  HALT
