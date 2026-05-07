; counted animation
; initialization
  LDI r8, 1358
  LDI r20, 0xC66C08
  LDI r14, 10
loop_0:
  LDI r11, 4
  LDI r7, 3147
  LDI r9, 3521
  WPIXEL
  MUL r7, r15, r1
  LDI r3, 1333
  LDI r15, 1208
  LDI r0, 267
  LDI r7, 4
  LDI r8, 3520
  LINE r3, r15, r0, r7, r8
  CMPI r14, r3, 16
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_0
  HALT
