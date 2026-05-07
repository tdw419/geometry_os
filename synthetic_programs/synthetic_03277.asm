; counted animation
; initialization
  LDI r15, 815
  LDI r1, 0x45E9E4
  LDI r9, 3861
  LDI r11, 8
loop_0:
  CMPI r8, r9, 0xED3D8F
  LDI r2, 1
  SUB r11, r11, r2
  JNZ r11, loop_0
  LDI r8, 33
loop_1:
  LDI r4, 491
  FILL r4
  MUL r4, r9, r0
  LDI r23, 1
  SUB r8, r8, r23
  JNZ r8, loop_1
  LDI r13, 10
loop_2:
  CMPI r26, r4, 1
  LDI r0, 255
  LDI r12, 0
  LDI r6, 2384
  WPIXEL
  ADDI r0, r11, 32
  LDI r15, 16
  LDI r0, 4
  LDI r13, 10
  PSETI
  LDI r0, 1
  SUB r13, r13, r0
  JNZ r13, loop_2
  HALT
