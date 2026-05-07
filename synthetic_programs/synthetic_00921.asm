; counted animation
; initialization
  LDI r4, 934
  LDI r2, 255
  LDI r11, 3206
  LDI r4, 4
loop_0:
  OR r6, r5, r12
  AND r18, r15, r13
  ADDI r9, r2, 64
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_0
  LDI r9, 0xA5B84E
loop_1:
  ANDI r10, r11, 31
  ADDI r13, r2, 255
  LDI r6, 1
  SUB r9, r9, r6
  JNZ r9, loop_1
  HALT
