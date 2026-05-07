; counted animation
; initialization
  LDI r13, 4095
  LDI r11, 2
  LDI r9, 0x1B40EE
loop_0:
  AND r13, r11, r8
  ANDI r15, r12, 0x7C03BE
  LDI r9, 2946
  LDI r13, 0x5A2288
  LDI r11, 1798
  PSET r9, r13, r11
  SHR r4, r11, r0
  LDI r27, 1
  SUB r9, r9, r27
  JNZ r9, loop_0
  LDI r5, 22
loop_1:
  MOD r5, r7, r3
  LDI r15, 1
  SUB r5, r5, r15
  JNZ r5, loop_1
  LDI r7, 10
loop_2:
  LDI r15, 255
  FILL r15
  LDI r2, 1
  SUB r7, r7, r2
  JNZ r7, loop_2
  HALT
