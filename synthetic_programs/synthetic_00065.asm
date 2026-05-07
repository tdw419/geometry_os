; counted animation
; initialization
  LDI r1, 3999
  LDI r0, 10
  LDI r11, 10
  LDI r13, 64
  LDI r15, 0x8011A9
loop_0:
  SHL r13, r8, r14
  CMPI r11, r0, 101
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_0
  HALT
