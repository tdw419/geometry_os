; counted animation
; initialization
  LDI r12, 951
  LDI r11, 0
  LDI r5, 43
loop_0:
  ANDI r10, r1, 10
  LDI r12, 1
  SUB r5, r5, r12
  JNZ r5, loop_0
  LDI r5, 256
loop_1:
  CMPI r6, r2, 0xD9ED38
  SHR r0, r2, r11
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_1
  HALT
