; counted animation
; initialization
  LDI r14, 8
  LDI r11, 987
  LDI r9, 2506
  LDI r1, 33
loop_0:
  LDI r14, 16
  LDI r14, 0x59A569
  LDI r0, 0xC8ACC9
  LDI r14, 32
  LDI r5, 2222
  RECTF r14, r14, r0, r14, r5
  MUL r1, r14, r9
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_0
  HALT
