; counted animation
; initialization
  LDI r14, 0x63DE9C
  LDI r9, 0x1B847E
  LDI r7, 0xAA0AC0
  LDI r3, 1581
  LDI r9, 43
loop_0:
  SUBI r4, r3, 0xD39DAA
  AND r4, r6, r15
  LDI r13, 0
  LDI r14, 1
  LDI r7, 0x5C2B17
  LDI r3, 0xF50EC6
  LDI r15, 2833
  LINE r13, r14, r7, r3, r15
  LDI r11, 1
  SUB r9, r9, r11
  JNZ r9, loop_0
  LDI r3, 6
loop_1:
  ADD r9, r11, r3
  SHL r10, r2, r14
  LDI r4, 1
  SUB r3, r3, r4
  JNZ r3, loop_1
  LDI r13, 256
loop_2:
  XOR r14, r18, r3
  LDI r4, 1
  SUB r13, r13, r4
  JNZ r13, loop_2
  HALT
