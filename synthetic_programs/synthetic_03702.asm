; counted animation
; initialization
  LDI r2, 946
  LDI r5, 8
  LDI r11, 0x592A7F
loop_0:
  CMPI r0, r11, 32
  LDI r13, 1340
  LDI r14, 1559
  LDI r11, 131
  LDI r8, 10
  LDI r3, 0x232553
  RECTF r13, r14, r11, r8, r3
  LDI r7, 1
  SUB r11, r11, r7
  JNZ r11, loop_0
  LDI r13, 29
loop_1:
  ADDI r14, r4, 0xF2BAAC
  SHR r14, r0, r2
  XOR r13, r0, r15
  LDI r5, 1
  SUB r13, r13, r5
  JNZ r13, loop_1
  LDI r13, 0xF737A8
loop_2:
  MOD r14, r7, r3
  LDI r8, 1
  SUB r13, r13, r8
  JNZ r13, loop_2
  HALT
