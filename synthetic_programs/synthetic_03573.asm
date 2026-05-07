; counted animation
; initialization
  LDI r1, 10
  LDI r14, 0xAFB171
  LDI r11, 4
loop_0:
  MOD r6, r4, r0
  LDI r4, 637
  LDI r1, 128
  LDI r6, 1
  PSET r4, r1, r6
  SUBI r13, r11, 79
  LDI r2, 0x3E2C42
  FILL r2
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_0
  LDI r5, 38
loop_1:
  SUBI r1, r7, 87
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_1
  LDI r11, 0x31CAEC
loop_2:
  LDI r0, 0xBF58ED
  LDI r1, 32
  LDI r1, 0x6F147A
  WPIXEL
  LDI r6, 0xAD135A
  LDI r15, 1573
  LDI r7, 64
  PSETI
  LDI r28, 0xFABAE3
  LDI r14, 0x7843A0
  LDI r5, 256
  PSET r28, r14, r5
  LDI r7, 932
  LDI r14, 256
  LDI r7, 0x420152
  PSETI
  LDI r10, 1
  SUB r11, r11, r10
  JNZ r11, loop_2
  HALT
