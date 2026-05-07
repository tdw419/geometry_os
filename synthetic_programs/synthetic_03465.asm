; counted animation
; initialization
  LDI r11, 16
  LDI r5, 609
  LDI r11, 0
loop_0:
  ADDI r21, r1, 0xC1DA5A
  DIV r6, r1, r5
  LDI r0, 3124
  LDI r8, 0x3BBFEC
  LDI r8, 3092
  PSETI
  SUBI r16, r1, 13
  LDI r7, 1
  SUB r11, r11, r7
  JNZ r11, loop_0
  LDI r15, 32
loop_1:
  CMPI r10, r6, 0xF1A2AE
  ADDI r0, r4, 170
  AND r5, r7, r14
  LDI r9, 1
  SUB r15, r15, r9
  JNZ r15, loop_1
  HALT
