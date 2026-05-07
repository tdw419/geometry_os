; counted animation
; initialization
  LDI r8, 2805
  LDI r3, 2381
  LDI r13, 1
loop_0:
  ADDI r7, r5, 117
  LDI r5, 8
  LDI r7, 1918
  LDI r3, 256
  WPIXEL
  SUBI r13, r7, 0xC5DBA6
  LDI r26, 1
  SUB r13, r13, r26
  JNZ r13, loop_0
  LDI r11, 1
loop_1:
  CMPI r15, r12, 71
  LDI r5, 1
  SUB r11, r11, r5
  JNZ r11, loop_1
  LDI r9, 128
loop_2:
  ADDI r4, r15, 128
  CMPI r14, r27, 164
  LDI r13, 1
  SUB r9, r9, r13
  JNZ r9, loop_2
  HALT
