; counted animation
; initialization
  LDI r15, 0x5BD64C
  LDI r4, 0x445095
  LDI r8, 2066
  LDI r11, 34
loop_0:
  ANDI r7, r10, 54
  LDI r14, 81
  LDI r2, 0
  LDI r15, 3145
  LDI r13, 0x8DB372
  LDI r7, 16
  LINE r14, r2, r15, r13, r7
  AND r6, r10, r11
  LDI r10, 1
  SUB r11, r11, r10
  JNZ r11, loop_0
  LDI r4, 255
loop_1:
  MUL r13, r9, r4
  LDI r13, 1
  SUB r4, r4, r13
  JNZ r4, loop_1
  HALT
