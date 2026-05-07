; counted animation
; initialization
  LDI r24, 94
  LDI r30, 8
  LDI r9, 128
  LDI r1, 255
  LDI r2, 0
loop_0:
  SUB r18, r14, r13
  LDI r14, 0x02D03A
  FILL r14
  CMPI r0, r8, 0xF02628
  CMPI r3, r5, 1
  LDI r11, 1
  SUB r2, r2, r11
  JNZ r2, loop_0
  LDI r15, 256
loop_1:
  CMPI r13, r0, 90
  ADDI r4, r2, 37
  SUB r2, r10, r5
  LDI r2, 1
  SUB r15, r15, r2
  JNZ r15, loop_1
  HALT
