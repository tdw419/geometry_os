; counted animation
; initialization
  LDI r12, 32
  LDI r11, 1918
  LDI r9, 2388
  LDI r2, 2
loop_0:
  ADDI r7, r6, 64
  CMPI r7, r6, 0xC15DB1
  LDI r3, 1
  SUB r2, r2, r3
  JNZ r2, loop_0
  HALT
