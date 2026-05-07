; counted animation
; initialization
  LDI r0, 3661
  LDI r6, 1610
  LDI r16, 3001
  LDI r8, 0x0D0515
loop_0:
  SUB r1, r6, r3
  LDI r9, 1
  SUB r8, r8, r9
  JNZ r8, loop_0
  LDI r0, 0x6D6EA8
loop_1:
  CMPI r3, r7, 32
  LDI r11, 1
  SUB r0, r0, r11
  JNZ r0, loop_1
  HALT
