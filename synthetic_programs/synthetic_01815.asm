; counted animation
; initialization
  LDI r25, 16
  LDI r7, 32
  LDI r5, 565
  LDI r31, 0x504431
  LDI r3, 10
  LDI r29, 0x5AF02B
loop_0:
  XOR r3, r6, r10
  LDI r6, 1073
  FILL r6
  LDI r15, 1
  SUB r29, r29, r15
  JNZ r29, loop_0
  LDI r11, 0
loop_1:
  CMPI r3, r8, 3
  CMPI r12, r8, 196
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_1
  HALT
