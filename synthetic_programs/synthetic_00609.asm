; counted animation
; initialization
  LDI r1, 91
  LDI r10, 1632
  LDI r5, 1005
  LDI r21, 0x580AA9
  LDI r9, 10
loop_0:
  SHL r5, r27, r11
  LDI r14, 1
  SUB r9, r9, r14
  JNZ r9, loop_0
  HALT
