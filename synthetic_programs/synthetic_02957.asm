; counted animation
; initialization
  LDI r5, 0xF732DA
  LDI r14, 2052
  LDI r15, 256
  LDI r17, 0xB221C6
  LDI r10, 1771
  LDI r6, 2438
  LDI r30, 2996
  LDI r9, 10
loop_0:
  MUL r3, r13, r5
  LDI r22, 0x04EDBB
  LDI r12, 2245
  LDI r6, 3630
  WPIXEL
  LDI r0, 3201
  FILL r0
  SHL r10, r13, r27
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_0
  HALT
